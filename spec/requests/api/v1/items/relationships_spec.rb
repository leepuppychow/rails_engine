# Items
# GET /api/v1/items/:id/invoice_items returns a collection of associated invoice items
# GET /api/v1/items/:id/merchant returns the associated merchant

require 'rails_helper'

describe 'Items API' do
  it "can show a list of associated invoice_items for a specific item" do
    item = create(:item)
    invoice = create)(:invoice)
    create_list(:invoice_item, 5, item: item, invoice: invoice)

    get "/api/v1/items/#{item.id}/invoice_items"

    expect(response).to be_success
    invoice_items = JSON.parse(response.body)
    expect(invoice_items.count).to eq 5
  end

  it 'can show a the associated merchants for a specific item' do

  end
end
