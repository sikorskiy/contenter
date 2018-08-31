class UsersController < ApplicationController
  def show
    @f = current_user
  end

  def index
    @u = User.all
  end
end
