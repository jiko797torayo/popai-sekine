class Users::ClientRecordsController < UsersController
  def index
    @clients = User.where(trainer_id: current_user.id)
    @records = Record.where(user_id: @clients.ids).
               preload(record_exercises: { exercise: :part }).
               preload(:comments).
               preload(:user)
  end

  def show
    @record = Record.
              eager_load(record_exercises: { exercise: :part }).
              eager_load(record_exercises: :exercise_details).
              find(params[:id])
    @comments = @record.comments
  end
end
