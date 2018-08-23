class UsersController < ApplicationController
  def show
  end

  def index
    @u = User.all

  end
end
