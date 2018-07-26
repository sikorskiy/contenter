class CompaniesController < ApplicationController
  before_action :authenticate_user!

  def new
    @company = Company.new
  end

  def create
    @company = Company.create(company_params)
    if @company.errors.any?
      flash.now[:warning] = @company.errors.full_messages
      render 'new'
    else
      redirect_to root_path
    end
  end

  def update
    @company = Company.find(params[:id])
    @company.update_attributes(company_params)
  end

  def edit
    @company = Company.find(params[:id])
  end

  def destroy
  end

  def index
    @companies = Company.all
  end

  private

  def company_params
    params.require(:company).permit(:name, :entity)
  end
end
