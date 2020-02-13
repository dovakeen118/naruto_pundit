class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }

  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to view this page!"
    redirect_to(request.referrer || root_path)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name])

    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:email)
    end

    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:full_name, :email, :password, :password_confirmation, :current_password)
    end
  end
end
