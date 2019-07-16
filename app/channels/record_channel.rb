class RecordChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'record_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # ActionCable.server.broadcast 'record_channel', comment: data['comment']
    Comment.create!(text: data['comment'])
  end
end
