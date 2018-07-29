class CampsController < ApplicationController
  before_action :authenticate_user!

  def index
    @camps = Camp.all
  end

  def new
    if current_user.is_admin?
      @camp = Camp.new
    else
      redirect_to edit_camp_path Camp.next_camp_for_edition
    end
  end

  def create
    @camp = Camp.create(camp_base_params)
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
    @camp = current_user.is_admin? ? Camp.find(params[:id]) : Camp.where('edition IS NULL').first
    # redirect_to edit_camp_path @camp
  end

  private

  def camp_content_params
    params.require(:camp).permit(
      { season_type_ids: [] }, { camp_category_ids: [] }, :preview, :program, :study, :schedule,
      :accommodation, :meal, :security, :pricing, :adds, :latitude, :longitude, :starting_age,
      :finish_age, :kids_in_group, :presentation, :kids_in_camp, :leaders_per_group,
      :foundation_year, :promo_day,  :photos, :video_links, :comment, :is_finished)
  end

  def camp_full_params
    params.require(:camp).permit(
      { season_type_ids: [] }, { camp_category_ids: [] }, :name, :url, :company_id, :incamp_url, :facebook, :vk, :ml_url, :dt_url,
      :inlearno_url, :bc_url, :pd_url, :preview, :program, :study, :schedule, :accommodation, :meal, :security,
      :pricing, :adds, :latitude, :longitude, :starting_age, :finish_age, :kids_in_group, :presentation,
      :kids_in_camp, :leaders_per_group, :foundation_year, :promo_day,  :photos, :video_links, :comment,
      :is_finished)
  end
end
