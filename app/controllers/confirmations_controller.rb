class ConfirmationsController < Devise::ConfirmationsController
  skip_before_action :verify_authenticity_token
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_up_path_for(resource)
    '/profile' # Or :prefix_to_your_route
  end
end
