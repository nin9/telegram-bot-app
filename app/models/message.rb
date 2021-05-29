# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :chat

  def as_json(options)
    super(options).merge(formatted_created_at: formatted_created_at)
  end

  def formatted_created_at
    created_at.strftime('%d %b %I:%M %p')
  end
end
