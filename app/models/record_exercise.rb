class RecordExercise < ApplicationRecord
  acts_as_paranoid

  attr_accessor :exercise_options

  belongs_to :record
  belongs_to :exercise
  belongs_to :part
  has_many :exercise_details, dependent: :destroy
  accepts_nested_attributes_for :exercise_details, reject_if: :all_blank, allow_destroy: true

  validates :exercise_details, presence: true
end
