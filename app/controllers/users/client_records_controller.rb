class Users::ClientRecordsController < UsersController
  before_action :comment_confirm, only: [:index]

  def index
    @records = Record.eager_load(:user).
               client(current_user).recent.
               preload(:comments, record_exercises: { exercise: :part })
    @new_comment_exist_records_ids = @records.new_comment_exist(current_user).ids
  end

  def show
    @record = Record.
              preload(comments: :user,
                      record_exercises: [:exercise_details, exercise: :part]).
              find(params[:id])
    return if @record.trainer_confirmed_at

    @record.update(trainer_confirmed_at: Time.zone.now)
  end
end
