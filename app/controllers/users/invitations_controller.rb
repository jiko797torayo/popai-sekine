class Users::InvitationsController < Devise::InvitationsController
  before_action :configure_permitted_parameters

  def new
    layout 'users'
    super
  end

  def create
    super
  end

  def edit
    super
  end

  def update
    super
  end

  def destroy
    super
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :accept_invitation,
      keys: [
        :nickname,
        :password,
        :password_confirmation,
        :invitation_token
      ]
    )
  end

  def after_accept_path_for(resource)
    users_root_path
  end
end
