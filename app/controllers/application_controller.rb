class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Remove this line as it's unsafe:
  # skip_before_action :verify_authenticity_token

  protected

  def after_sign_in_path_for(resource)
    '/profile'
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:fullname, :phone_number, :description])
  end
end
