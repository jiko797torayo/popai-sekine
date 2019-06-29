class Exercise < ApplicationRecord
  acts_as_paranoid
  has_many :record_exercises, dependent: :destroy
end
