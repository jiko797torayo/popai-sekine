class ChangeColumnConfirmationAtToComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :confirmation_at, :receiver_confirmed_at
  end
end
