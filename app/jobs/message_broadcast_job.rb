class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "chat_rooms_#{message.chat_room.id}_channel",
                                 message: "<div class=\"card\"><div class=\"card-block\"><div class=\"row\"><div class=\"col-md-1\">#{gravatar_for message.user}</div><div class=\"col-md-11\"><p class=\"card-text\"><span class=\"text-muted\">#{message.user.name} at #{message.timestamp} says</span><br>#{message.body}</p></div></div></div></div>"
  end
end
