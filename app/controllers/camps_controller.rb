class CampsController < ApplicationController
  before_action :authenticate_user!

  def index
    q = params[:user_ids].blank? ? Camp.all : Camp.where('user_id in (?)', params[:user_ids])
    @camps = current_user.is_admin? ? q.where(is_approved: [0, nil]) : Camp.where('user_id = ? AND (is_approved IS NULL OR is_approved = FALSE)', current_user.id)

    respond_to do |format|
      format.html
      format.csv { send_data Camp.as_csv }
    end
  end

  def autosave
    @camp = Camp.find(params[:camp_id])
    params[:is_finished] = @camp.is_finished if current_user.is_admin? #only for content person is ok to change is_finished
    @camp.update_attributes(current_user.is_admin? ? camp_full_params : camp_content_params)
  end

  def statistics
  end

  def payments
    @users = User.all
  end

  def new
    if current_user.is_admin?
      @camp = Camp.new
    else
      @camp = Camp.next_camp_for_edition current_user.id
      if @camp.blank?
        flash[:warning] = 'Нет лагерей для создания. Обратитесь к администратору'
        redirect_to root_path
      else
        @camp.update_attribute(:user, current_user)
        redirect_to edit_camp_path @camp
      end

    end
  end

  def create
    @camp = Camp.create(camp_full_params)
    @camp.update_attribute(:is_finished, nil)
    @camp.user = current_user
    @camp.save
    if @camp.errors.any?
      flash.now[:warning] = @camp.errors.full_messages
      render 'new'
    else
      redirect_to root_path
    end
  end

  def update
    @camp = Camp.find(params[:id])
    params[:is_finished] = @camp.is_finished if current_user.is_admin? #only for content person is ok to change is_finished
    @camp.update_attributes(current_user.is_admin? ? camp_full_params : camp_content_params) if params[:version_number].to_i > @camp.version_number || current_user.is_admin?
    redirect_to camp_path @camp
  end

  def show
    @camp = Camp.find(params[:id])
  end

  def edit
    @camp = Camp.find(params[:id])
    if @camp.user == current_user || current_user.is_admin?
      @camp.update_attribute(:is_finished, false) unless current_user.is_admin?
    else
      flash[:warning] = 'Вы не можете редактировать этот лагерь'
      redirect_to root_path
    end

  end


  private

  def update_geotags
    unless params[:camp][:geotag_ids].blank?
      geotags = params[:camp][:geotag_ids].collect do |g|
        if g.to_i.zero?
          geotag = Geotag.create(name: g)
          geotag.id.to_s
        else
          g
        end
      end
      params[:camp][:geotag_ids] = geotags
    end
  end

  def camp_content_params
    update_geotags
    params.require(:camp).permit!
  end

  def camp_full_params
    # is_finished is absent cause only content-person should check it
    update_geotags
    params.require(:camp).permit!
  end
end
