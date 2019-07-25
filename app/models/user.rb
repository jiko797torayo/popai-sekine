class User < ApplicationRecord
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, invite_for: 24.hours
  has_many :records, dependent: :destroy
  has_many :comments, dependent: :destroy
end
