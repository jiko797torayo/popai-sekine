class Comment < ApplicationRecord
  acts_as_paranoid

  belongs_to :user, optional: true
  belongs_to :record, optional: true

  validates :text, presence: true

  after_create_commit { CommentBroadcastJob.perform_later self }

  def not_confirm_comment_exit?
    receiver_confirmed_at ? false : true
  end
end
