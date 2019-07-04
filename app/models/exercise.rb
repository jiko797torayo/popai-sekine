class Exercise < ApplicationRecord
  acts_as_paranoid
  belongs_to :part
  has_many :record_exercises, dependent: :destroy
end
