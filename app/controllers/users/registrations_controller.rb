class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  private

  def after_sign_up_path_for(resource)
    new_user_session_path
  end

  def after_inactive_sign_up_path_for(resource)
    new_user_session_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [
        :nickname,
        :email,
        :password,
        :password_confirmation,
      ]
    )
  end
end
