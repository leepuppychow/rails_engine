require 'rails_helper'

describe Invoice do
  describe "Validations" do
    it {is_expected.to validate_presence_of(:customer_id)}
    it {is_expected.to validate_presence_of(:merchant_id)}
    it {is_expected.to validate_presence_of(:merchant_id)}
    it {is_expected.to validate_presence_of(:status)}
    it {is_expected.to validate_presence_of(:updated_at)}
  end

  describe "Relationships" do
    it "belongs_to customer" do
      is_expected.to belong_to(:customer)
    end

    it "belongs_to merchant" do
      is_expected.to belong_to(:merchant)
    end

    it "has_many invoice_items" do
      is_expected.to have_many(:invoice_items)
    end

    it "has_many invoices" do
      is_expected.to have_many(:invoices)
    end

  end
end
