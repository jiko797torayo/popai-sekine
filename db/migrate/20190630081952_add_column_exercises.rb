class AddColumnExercises < ActiveRecord::Migration[5.2]
  def change
    add_column :exercises, :part_id, :integer
    remove_column :exercises, :part, :string
  end
end
