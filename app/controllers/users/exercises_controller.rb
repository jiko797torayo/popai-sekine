class Users::ExercisesController < UsersController
  def index
    exercises = Exercise.where(part_id: params[:part_id])
    render json: exercises.select(:id, :name)
  end
end
