class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :records, dependent: :destroy
  has_many :comments, dependent: :destroy

  def trainer?
    User.find_by(trainer_id: id) ? true : false
  end
end
