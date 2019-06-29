class CreateExerciseDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :exercise_details do |t|
      t.integer   :record_exercise_id
      t.integer   :set_count
      t.integer   :weight
      t.integer   :rep_count
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
