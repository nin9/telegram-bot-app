# frozen_string_literal: true

RSpec.describe MessagesController, type: :controller do
  describe 'Post messages' do
    it 'calls telegram bot sendMessage with message body', telegram_bot: :poller do
      chat = Chat.create(telegram_id: 'telegram_id', first_name: 'name')
      expect { post :create, params: { message: { chat_id: chat.id, body: 'hello' } } }.to make_telegram_request(bot, :sendMessage)
        .with(hash_including(text: 'hello'))
    end
  end
end
