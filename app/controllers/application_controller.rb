class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  #protect_from_forgery with: :exception
  #skip_before_action :verify_authenticity_token # this line allows sign in on Postman

  # Overwriting the sign_out redirect path method
=begin
  def after_sign_out_path_for(current_user)
    root_path
  end
=end

  protected

  # tells devise to permit other params too
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :lastname, :phone, :city, :country, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :lastname, :phone, :city, :country, :role])
  end

  def user_not_authorized
    render plain: "You don't have access to this page.", status: 500
  end

  def not_found
    render file: "#{Rails.root}/public/404.html", status: 404, layout: false
  end

end
