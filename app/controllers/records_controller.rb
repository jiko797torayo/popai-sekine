class RecordsController < ApplicationController
  layout 'users'
  before_action :authenticate_user!

  def new
    @record = Record.new
    @record_exercise = @record.record_exercises.build
    @exercise_detail = @record_exercise.exercise_details.build
    @exercises = Exercise.all
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def record_params
    params.require(:record).permit(
      :user_id,
      record_exercises_attributes: [
        :id,
        :exercise_id,
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
