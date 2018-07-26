class CampsController < ApplicationController
  before_action :authenticate_user!

  def index
    @camps = Camp.all
  end

  def new
    @camp = Camp.new
  end

  def create
    @camp = Camp.create(camp_params)
    if @camp.errors.any?
      flash.now[:warning] = @camp.errors.full_messages
      render 'new'
    else
      redirect_to root_path
    end
  end

  def update
    @camp = Camp.find(params[:id])
    @camp.update_attributes(camp_params)

    redirect_to camps_path
  end

  def edit
    @camp = Camp.find(params[:id])
  end

  private

  def camp_params
    params.require(:camp).permit(:name,:url,:company_id,:incamp_url,:facebook,:vk,:ml_url,:dt_url,:inlearno_url,:bc_url,:pd_url)
  end
end
