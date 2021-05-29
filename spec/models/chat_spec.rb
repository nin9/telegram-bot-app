# frozen_string_literal: true

RSpec.describe Chat, type: :model do
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:telegram_id) }
  it { is_expected.to validate_uniqueness_of(:telegram_id) }
  it { is_expected.to have_many :messages }
end
