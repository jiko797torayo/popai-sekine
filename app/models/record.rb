class Record < ApplicationRecord
  acts_as_paranoid

  belongs_to :user

  has_many :record_exercises, dependent: :destroy
  accepts_nested_attributes_for :record_exercises, reject_if: :all_blank, allow_destroy: true
  has_many :comments, dependent: :destroy

  validates :record_exercises, presence: true

  scope :recent, -> { order(created_at: :desc) }
  scope :client, ->(current_user) { where(users: { trainer_id: current_user }) }
  scope :new_comment_exist, ->(current_user) { joins(:comments).where.not(comments: { user_id: current_user }).where(comments: { receiver_confirmed_at: nil }) }
end
