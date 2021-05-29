class TelegramWebhooksController < Telegram::Bot::UpdatesController
  def message(message)
    chat_id = message.dig('from', 'id')
    first_name = message.dig('from', 'first_name')
    last_name = message.dig('from', 'last_name')

    chat = Chat.find_or_create_by!(telegram_id: chat_id, first_name: first_name, last_name: last_name)
    msg = message.dig('text')
    new_message = chat.messages.create!(body: msg, sender_first_name: first_name)
    ChatChannel.broadcast_to chat, new_message
  end
end
