class UsersController < ApplicationController
  def show
   @fin = 0
   @appr = 0
   @all = 0
    @f = current_user
    #@user = User.find(params[:id])

  end

  def index
    @u = User.all
  end
  def check_camp
   @с_user = User.find_by_id(params[:user_id])

  end
end
