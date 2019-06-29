class Admins::ExercisesController < AdminsController
  before_action :set_exercise, only: [:edit, :update, :destroy]

  def index
    @objects = Exercise.all
  end

  def new
    @obj = Exercise.new
  end

  def create
    @obj = Exercise.new(exercise_params)

    if @obj.save
      redirect_to admins_exercises_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @obj.update(exercise_params)
      redirect_to admins_exercises_path
    else
      render :edit
    end
  end

  def destroy
    @obj.destroy
    redirect_to admins_exercises_path
  end

  private

  def exercise_params
    params.require(:exercise).permit(
      :name,
      :part
    )
  end

  def set_exercise
    @obj = Exercise.find(params[:id])
  end
end
