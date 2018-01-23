require 'rails_helper'

describe Item do
  describe "Validations" do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_presence_of(:description)}
    it {is_expected.to validate_presence_of(:unit_price)}
    it {is_expected.to validate_presence_of(:merchant_id)}
    it {is_expected.to validate_presence_of(:updated_at)}
    it {is_expected.to validate_presence_of(:created_at)}
  end

  describe "Relationships" do

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
