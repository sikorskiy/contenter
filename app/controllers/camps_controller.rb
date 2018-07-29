class CampsController < ApplicationController
  before_action :authenticate_user!

  def index
    @camps = current_user.is_admin? ? Camp.all : Camp.where('user_id = ?', current_user.id)
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
    @camp.update_attributes(current_user.is_admin? ? camp_full_params : camp_content_params)
    redirect_to camps_path
  end

  def edit
    @camp = Camp.find(params[:id])
    if @camp.user == current_user
      @camp.update_attribute(:is_finished, false) unless current_user.is_admin?
    else
      flash[:warning] = 'Вы не можете редактировать этот лагерь'
      redirect_to root_path
    end

  end

  private

  def camp_content_params
    params.require(:camp).permit(
      { season_type_ids: [] }, { camp_category_ids: [] }, { geotag_ids: [] }, :preview, :program, :study, :schedule,
      :accommodation, :meal, :security, :pricing, :adds, :latitude, :longitude, :starting_age,
      :finish_age, :kids_in_group, :presentation, :kids_in_camp, :leaders_per_group,
      :foundation_year, :promo_day,  :photos, :video_links, :comment, :is_finished)
  end

  def camp_full_params
    # is_finished is absent cause only content-person should check it
    params.require(:camp).permit(
      { season_type_ids: [] }, { camp_category_ids: [] }, { geotag_ids: [] }, :name, :url, :company_id, :incamp_url, :facebook, :vk, :ml_url, :dt_url,
      :inlearno_url, :bc_url, :pd_url, :preview, :program, :study, :schedule, :accommodation, :meal, :security,
      :pricing, :adds, :latitude, :longitude, :starting_age, :finish_age, :kids_in_group, :presentation,
      :kids_in_camp, :leaders_per_group, :foundation_year, :promo_day,  :photos, :video_links, :comment)
  end
end
