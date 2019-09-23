class TrainerRequest < ApplicationRecord
  attr_accessor :email
  has_secure_token :request_token

  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :trainer, class_name: 'User', foreign_key: 'trainer_id'

  def invalid?(current_user)
    nil? || accepted_at || (user_id != current_user.id)
  end
end
