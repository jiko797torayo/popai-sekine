class RecordChannel < ApplicationCable::Channel
  def subscribed
    stream_from "record_channel_#{params['record']}"
  end

  def unsubscribed
  end

  def speak(data)
    Comment.create!(record_id: data['record'], user_id: data['user'], text: data['comment'])
  end
end
