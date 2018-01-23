require 'rails_helper'

describe InvoiceItem do
  describe "Validations" do
    it {is_expected.to validate_presence_of(:item_id)}
    it {is_expected.to validate_presence_of(:invoice_id)}
    it {is_expected.to validate_presence_of(:quantity)}
    it {is_expected.to validate_presence_of(:unit_price)}
    it {is_expected.to validate_presence_of(:updated_at)}
    it {is_expected.to validate_presence_of(:created_at)}
  end

  describe "Relationships" do
    it "belongs_to item" do
      is_expected.to belong_to(:item)
    end

    it "belongs_to invoice" do
      is_expected.to belong_to(:invoice)
    end
  end

  describe "Instance methods" do
    it "can calculate revenue for an invoice item" do
      invoice_item = create(:invoice_item, quantity: 5, unit_price: 50)

      expect(invoice_item.revenue).to eq 250
    end
  end
end
