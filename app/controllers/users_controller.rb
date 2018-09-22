class UsersController < ApplicationController
  def show
<<<<<<< HEAD
    @f = current_user
=======
    @user = User.find(params[:id])
>>>>>>> ddd3020b0e3bca43eb5bc40aaa4117c6bc116a79
  end

  def index
    @u = User.all
  end
  def check_camp
   @с_user = User.find_by_id(params[:user_id])

  end
end
