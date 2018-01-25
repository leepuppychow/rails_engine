require 'rails_helper'

describe "Invoice Items API" do
  it "can show the associated invoice and item for a specific invoice item" do
    item = create(:item)
    invoice = create(:invoice)
    invoice_item = create(:invoice_item, item: item, invoice: invoice)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    found_invoice = JSON.parse(response.body)
    expect(found_invoice["id"]).to eq invoice.id

    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    found_item = JSON.parse(response.body)
    expect(found_item["id"]).to eq item.id
  end
end
