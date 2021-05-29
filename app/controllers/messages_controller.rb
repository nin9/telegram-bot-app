# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :set_chat

  def create
    @message = Message.create!(chat: @chat, body: params.dig(:message, :body),
                               sender_first_name: BotInfo.name)
    Telegram.bot.send_message(chat_id: @chat.telegram_id, text: @message.body)
    ChatChannel.broadcast_to @chat, @message
  end

  private

  def set_chat
    @chat = Chat.find(params.dig(:message, :chat_id))
  end
end
