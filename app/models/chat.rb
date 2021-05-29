# frozen_string_literal: true

class Chat < ApplicationRecord
  has_many :messages, dependent: :destroy, inverse_of: :chat

  validates :first_name, :telegram_id, presence: true
  validates :telegram_id, uniqueness: true
end
