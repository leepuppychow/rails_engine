require 'rails_helper'

describe Customer do
  describe "Validations" do
    it {is_expected.to validate_presence_of(:first_name)}
    it {is_expected.to validate_presence_of(:last_name)}
    it {is_expected.to validate_presence_of(:created_at)}
    it {is_expected.to validate_presence_of(:updated_at)}
  end

  describe "Relationships" do
    it {is_expected.to have_many(:invoices)}
    it {is_expected.to have_many(:merchants).through(:invoices)}
  end

  describe "Instance Methods" do
    xit "can find favorite customer" do
      merchant = create(:merchant)
      create_list(:customer, 4)
      custom_customer = create(:customer)
      create_list(:invoice, 3, customer: custom_customer, merchant: merchant)
      create(:invoice, merchant: merchant)

      expect(merchant.favorite_customer).to eq custom_customer
    end
  end
end
