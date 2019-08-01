class UsersController < ApplicationController
  layout 'users'
  before_action :authenticate_user!

  def comment_confirm
    before_path = begin
                    Rails.application.routes.recognize_path(request.referer)
                  rescue StandardError
                    false
                  end
    return false unless before_path[:controller].in?(['users/records', 'users/client_records'])
    return false unless before_path[:action].eql?('show')

    partner_comments = Comment.where(record_id: before_path[:id]).where.not(user_id: current_user.id)
    partner_comments.each do |comment|
      comment.update(receiver_confirmed_at: Time.zone.now) if comment.receiver_confirmed_at.nil?
    end
  end
end
