class CommentBroadcastJob < ApplicationJob
  queue_as :default

  def perform(comment)
    ActionCable.server.broadcast "record_channel_#{comment.record_id}", comment: render_comment(comment)
  end

  private

  def render_comment(comment)
    # ApplicationController.render_with_signed_in_user(comment.user_id, 'users/comments/_comment.html.erb', locals: { comment: comment })
    ApplicationController.renderer.render partial: 'users/comments/comment', locals: { comment: comment }
  end
end
