class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters
  layout 'users'

  private

  def after_sign_up_path_for(resource)
    root_path
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
