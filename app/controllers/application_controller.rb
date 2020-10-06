class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name_reading_first])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name_reading_last])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:birthday])
  end
end
