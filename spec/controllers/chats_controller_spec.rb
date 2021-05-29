# frozen_string_literal: true

RSpec.describe ChatsController, type: :controller do
  render_views

  describe 'GET chats' do
    it 'renders the index view' do
      get :index
      expect(response).to render_template('chats/index')
    end
  end

  describe 'GET chats/:id' do
    it 'renders the show view' do
      chat = Chat.create(telegram_id: 'telegram_id', first_name: 'name')
      get :show, params: { id: chat.id }
      expect(response).to render_template('chats/show')
    end
  end
end
