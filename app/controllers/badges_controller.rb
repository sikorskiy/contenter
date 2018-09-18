class BadgesController < ApplicationController
  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.create(badges_params)
  end

  def index
    @badges = Badge.all
  end

  def show
    @badge = Badge.find(params[:id])
  end

  def edit
    @badge = Badge.find(params[:id])
  end

  def update
    @badge = Badge.find(params[:id]).update_attributes(badges_params)
    redirect_to badge_path(@badge)
  end

  def badges_params
    params.require(:badge).permit(:name, :description, :main_picture)
  end
end
