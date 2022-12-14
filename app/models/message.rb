class Message < ApplicationRecord
  after_create_commit { broadcast_message }

  private

  def broadcast_message
    ActionCable.server.broadcast('MessagesChannel', {
                                   id:,
                                   body:
                                 })
  end
end
