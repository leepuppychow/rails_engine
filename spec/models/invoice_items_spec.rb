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


end
