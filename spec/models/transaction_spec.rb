require 'rails_helper'

describe Transaction do
  describe "Validations" do
    it {is_expected.to validate_presence_of(:credit_card_number)}
    it {is_expected.to validate_presence_of(:credit_card_expiration_date)}
    it {is_expected.to validate_presence_of(:result)}
    it {is_expected.to validate_presence_of(:created_at)}
    it {is_expected.to validate_presence_of(:updated_at)}
  end

  describe "Relationships" do
    it {is_expected.to belong_to(:invoice)}
  end
end
