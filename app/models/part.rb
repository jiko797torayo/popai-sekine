class Part < ApplicationRecord
  acts_as_paranoid
  has_many :exercises, dependent: :destroy
end
