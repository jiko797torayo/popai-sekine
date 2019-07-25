class Users::ExercisesController < UsersController
  def index
    part = Part.find(params[:part_id])
    render json: part.exercises.select(:id, :name)
  end
end
