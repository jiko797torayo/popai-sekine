class AddColumnExerciseCountToRecordExercises < ActiveRecord::Migration[5.2]
  def change
    add_column :record_exercises, :exercise_count, :integer
  end
end
