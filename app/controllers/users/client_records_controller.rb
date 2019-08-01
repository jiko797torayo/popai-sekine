class Users::ClientRecordsController < UsersController
  before_action :comment_confirm, only: [:index]

  def index
    @clients = User.where(trainer_id: current_user.id)
    @records = Record.where(user_id: @clients.ids).
               preload(record_exercises: { exercise: :part }).
               preload(:comments).
               preload(:user)
    @not_confirm_comment_exit_record = Comment.where.not(user_id: current_user.id).where(receiver_confirmed_at: nil).map(&:record_id).uniq!
  end

  def show
    @record = Record.
              eager_load(record_exercises: { exercise: :part }).
              eager_load(record_exercises: :exercise_details).
              find(params[:id])
    @record.update(trainer_confirmed_at: Time.zone.now)
    @comments = @record.comments
  end
end
