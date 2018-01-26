require 'rails_helper'

describe "User makes request from Items" do

  it "returns the best day for an item" do

    item = create(:item)
    invoices = create_list(:invoice, 3, created_at: "2012-03-27T14:54:05.000Z")
    create(:invoice)
    create(:invoice)

    invoice_item_1 = create(:invoice_item, item: item, invoice: invoices[0])
    invoice_item_1 = create(:invoice_item, item: item, invoice: invoices[1])
    invoice_item_1 = create(:invoice_item, item: item, invoice: invoices[2])
    invoice_item_1 = create(:invoice_item)
    invoice_item_1 = create(:invoice_item)

    transactions = create(:transaction, invoice: invoices[0])
    transactions = create(:transaction, invoice: invoices[1])
    transactions = create(:transaction, invoice: invoices[2])

    get "/api/v1/items/#{item.id}/best_day"
    best_day = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(best_day[:best_day]).to eq ("2012-03-27T14:54:05.000Z")

  end

  it "returns the top items by total number sold" do
    items = create_list(:item, 2)
    invoice_item_1 = create(:invoice_item, item: items[0], quantity: 10)
    invoice_item_2 = create(:invoice_item, item: items[1], quantity: 1)

    get "/api/v1/items/most_items?quantity=1"
    top_item = JSON.parse(response.body, symbolize_names: true)
    # binding.pry
    expect(response).to be_success
    expect(top_item[0][:id]).to eq(items[0].id)

  end

  it "returns the top items by most revenue" do
    items = create_list(:item, 2)
    invoice_item_1 = create(:invoice_item, item: items[0], quantity: 10, unit_price: 50)
    invoice_item_2 = create(:invoice_item, item: items[1], quantity: 1, unit_price: 20)


    get "/api/v1/items/most_revenue?quantity=1"
    top_item = JSON.parse(response.body, symbolize_names: true)
    # binding.pry
    expect(response).to be_success
    expect(top_item[0][:id]).to eq(items[0].id)

  end

end
# GET /api/v1/items/:id/best_day
