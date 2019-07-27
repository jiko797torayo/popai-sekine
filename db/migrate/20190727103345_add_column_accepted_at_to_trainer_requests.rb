class AddColumnAcceptedAtToTrainerRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :trainer_requests, :accepted_at, :datetime
  end
end
