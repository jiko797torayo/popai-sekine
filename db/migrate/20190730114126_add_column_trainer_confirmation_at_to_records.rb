class AddColumnTrainerConfirmationAtToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :trainer_confirmed_at, :datetime
  end
end
