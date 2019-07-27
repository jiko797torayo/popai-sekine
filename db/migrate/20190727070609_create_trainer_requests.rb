class CreateTrainerRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :trainer_requests do |t|
      t.integer :user_id
      t.integer :trainer_id
      t.string :request_token
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
