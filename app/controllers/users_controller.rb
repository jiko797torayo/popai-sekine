class UsersController < ApplicationController
  layout 'users'
  before_action :authenticate_user!

  private

  def comment_confirm
    path = referer_path
    return unless records_show_path?(path)

    unread_comments = Comment.where.not(user_id: current_user.id).
                      where(record_id: path[:id], receiver_confirmed_at: nil)
    unread_comments.update_all(receiver_confirmed_at: Time.zone.now)
  end

  def referer_path
    Rails.application.routes.recognize_path(request.referer)
  rescue StandardError
    false
  end

  def records_show_path?(path)
    path[:controller].in?(['users/records', 'users/client_records']) &&
      path[:action].eql?('show')
  end
end
