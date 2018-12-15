require 'csv'
class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def downloads
    case params[:type]
    when 'companies'
      data = Company.as_csv
    when 'shifts'
      data = CampShift.as_csv
    when 'seasons'
      data = SeasonType.as_csv
    when 'geotags'
      data = Geotag.as_csv
    when 'seasonship'
      data = Seasonship.as_csv
    when 'taggization'
      data = Taggization.as_csv
    when 'leaders'
      data = GroupLeader.as_csv
    when 'reviews'
      data = Review.as_csv
    when 'reviews'
      data = Review.as_csv
    when 'reviewroles'
      data = ReviewRole.as_csv
    when 'categorization'
      data = Categorization.as_csv
    when 'campcategories'
      data = CampCategory.as_csv
    end

    respond_to do |format|
      format.html
      format.csv { send_data data, filename: params[:type] + '.csv'}
    end
  end

  protected

  def configure_permitted_parameters
    #attributes = %i[name user_role_id user_role]
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :user_role, :user_role_id, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :user_role, :user_role_id, :password_confirmation) }
    #devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    #devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

  def company_download
    respond_to do |format|
      format.html
      format.csv { send_data Camp.as_csv }
    end
  end

end
