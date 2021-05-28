# frozen_string_literal: true

class ChatsController < ApplicationController
  before_action :set_chat, only: %i[show]

  def index
    @chats = Chat.all
  end

  def show
    @chats = Chat.where.not(id: @chat.id)
    @messages = @chat.messages
    @message = Message.new chat: @chat
  end

  private

  def set_chat
    @chat = Chat.find(params[:id])
  end

  def chat_params
    params.require(:chat).permit(:message)
  end
end
