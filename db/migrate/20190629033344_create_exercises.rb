class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :part
      t.integer :user_id
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
