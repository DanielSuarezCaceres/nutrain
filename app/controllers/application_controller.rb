class ApplicationController < ActionController::Base
  include Pagy::Backend #pagination
  include Pundit #authorization
  
  #before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  #protect_from_forgery with: :exception
  #skip_before_action :verify_authenticity_token # this line allows sign in on Postman

  # Overwriting the sign_out redirect path method
=begin
  def after_sign_out_path_for(current_user)
    root_path
  end
=end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActionController::RoutingError, with: :not_found
  #rescue_from ActiveRecord::InvalidForeignKey, with: :not_delete

  protected

  # tells devise to permit other params too
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :lastname, :phone, :gender, :description,  :city, :country, :type])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :lastname, :phone, :gender, :description, :city, :country, :type])
  end

  def user_not_authorized
    render plain: "You don't have access to this page.", status: 500
  end

  def not_found
    render file: "#{Rails.root}/public/404.html", status: 404, layout: false
  end

  #def not_delete(e)
  #  flash[:error] = "You can not delete this resource"
  #end

end
