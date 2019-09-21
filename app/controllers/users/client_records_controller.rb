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
              eager_load(record_exercises: { exercise: :part }).
              eager_load(record_exercises: :exercise_details).
              find(params[:id])
    @record.update(trainer_confirmed_at: Time.zone.now)
    @comments = @record.comments
  end
end
