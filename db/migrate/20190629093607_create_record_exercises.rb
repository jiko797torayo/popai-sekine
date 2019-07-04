class CreateRecordExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :record_exercises do |t|
      t.integer  :record_id
      t.integer  :exercise_id
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
