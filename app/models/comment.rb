class Comment < ApplicationRecord
  acts_as_paranoid
  belongs_to :user, optional: true
  belongs_to :record, optional: true
  validates :text, presence: true
  after_create_commit { CommentBroadcastJob.perform_later self }
end
