# frozen_string_literal: true

RSpec.describe Message, type: :model do
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:sender_first_name) }
  it { is_expected.to belong_to :chat }
end
