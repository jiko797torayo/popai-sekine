class ExerciseDetail < ApplicationRecord
  acts_as_paranoid
  belongs_to :record_exercise
end
