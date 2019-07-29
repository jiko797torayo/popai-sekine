class Users::ProfilesController < UsersController
  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :icon_image,
      :remove_icon_image
    )
  end
end
