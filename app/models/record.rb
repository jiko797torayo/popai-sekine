class Record < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  has_many :record_exercises, dependent: :destroy
  accepts_nested_attributes_for :record_exercises, reject_if: :all_blank, allow_destroy: true
  has_many :comments, dependent: :destroy
end
