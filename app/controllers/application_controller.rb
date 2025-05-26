class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[email password password_confirmation])
  end

  def current_user
    if request.headers["Authorization"].present?
      jwt_payload = JWT.decode(request.headers["Authorization"].split(" ").last, Rails.application.credentials.devise_jwt_secret_key!).first

      token = jwt_payload[:jti] || jwt_payload["jti"]

      User.find_by(jti: token)
    else
      throw StandardError.new("Authorization Header is missing.")
    end
  end
end
