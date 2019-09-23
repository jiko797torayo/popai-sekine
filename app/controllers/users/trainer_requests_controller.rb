class Users::TrainerRequestsController < UsersController
  def new
    @trainer_request = TrainerRequest.new
  end

  def create
    @trainer_request = TrainerRequest.new(
      user_id: User.find_by(email: trainer_request_params[:email])&.id,
      trainer_id: current_user.id
    )
    if @trainer_request.save
      TrainerRequestMailer.send_to_user(@trainer_request).deliver
      TrainerRequestMailer.send_to_trainer(@trainer_request).deliver
      redirect_to root_path
    else
      render :new
    end
  end

  def confirm
    @trainer_request = TrainerRequest.find_by(request_token: params[:request_token])
    redirect_to root_path if @trainer_request.invalid?(current_user)
  end

  def accept
    @trainer_request = TrainerRequest.find_by(request_token: params[:request_token])
    @trainer_request.update(accepted_at: Time.zone.now)
    current_user.update(trainer_id: @trainer_request.trainer_id)
    redirect_to root_path
  end

  private

  def trainer_request_params
    params.require(:trainer_request).permit(
      :email
    )
  end
end
