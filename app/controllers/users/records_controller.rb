class Users::RecordsController < UsersController
  before_action :comment_confirm, only: [:index]

  def index
    @records = current_user.records.recent.
               preload(:comments, record_exercises: { exercise: :part })
    @trainer = current_user.trainer
    @new_comment_exist_records_ids = @records.
                                     new_comment_exist(current_user).ids.uniq!
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @record = Record.
              preload(comments: :user,
                      record_exercises: [:exercise_details, exercise: :part]).
              find(params[:id])
  end

  private

  def record_params
    params.require(:record).permit(
      :user_id,
      record_exercises_attributes: [
        :id,
        :part_id,
        :exercise_id,
        :exercise_count,
        :_destroy,
        exercise_details_attributes: [
          :id,
          :set_count,
          :weight,
          :rep_count,
          :_destroy
        ]
      ]
    )
  end
end
