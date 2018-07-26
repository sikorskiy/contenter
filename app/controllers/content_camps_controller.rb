class ContentCampsController < ApplicationController
  before_action :authenticate_user!

  def index
    @content_camp = ContentCamp.all
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
  end

  def delete
  end
end
