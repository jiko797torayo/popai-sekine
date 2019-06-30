class AddColumnPartIdToRecordExercises < ActiveRecord::Migration[5.2]
  def change
    add_column :record_exercises, :part_id, :integer
  end
end
