class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  belongs_to :trainer, class_name: 'User', foreign_key: 'trainer_id'

  has_many :records, dependent: :destroy
  has_many :comments, dependent: :destroy

  mount_uploader :icon_image, UserIconImageUploader

  def trainer?
    User.find_by(trainer_id: id) ? true : false
  end
end
