class TrainerRequest < ApplicationRecord
  attr_accessor :email
  has_secure_token :request_token

  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :trainer, class_name: 'User', foreign_key: 'trainer_id'
end
