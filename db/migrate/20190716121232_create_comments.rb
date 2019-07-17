class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :record_id
      t.integer :user_id
      t.text :text
      t.datetime :confirmation_at
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
