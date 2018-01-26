require 'rails_helper'

describe "User searches for an invoice_item by parameters" do

  it "returns a valid invoice_item by id" do

    invoice_item_1 = create(:invoice_item)
    create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/find?id=#{invoice_item_1.id}"
    served_invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoice_item[:id]).to eq(invoice_item_1.id)

  end

  it "returns a valid invoice_item by item_id" do
    item = create(:item)
    invoice_item_1 = create(:invoice_item, item: item)
    create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/find?item_id=#{invoice_item_1.item_id}"
    served_invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoice_item[:id]).to eq(invoice_item_1.id)

  end

  it "returns a valid invoice_item by invoice_id" do
    invoice = create(:invoice)
    invoice_item_1 = create(:invoice_item, invoice: invoice )
    create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/find?invoice_id=#{invoice_item_1.invoice_id}"
    served_invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoice_item[:id]).to eq(invoice_item_1.id)

  end

  it "returns a valid invoice_item by quantity" do

    invoice_item_1 = create(:invoice_item, quantity: 10 )
    create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/find?quantity=#{invoice_item_1.quantity}"
    served_invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoice_item[:id]).to eq(invoice_item_1.id)

  end

  it "returns a valid invoice_item by unit_price" do

    invoice_item_1 = create(:invoice_item, unit_price: 777)
    create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/find?unit_price=7.77"
    served_invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoice_item[:id]).to eq(invoice_item_1.id)

  end

  it "returns a valid invoice_item by created_at" do

    invoice_item_1 = create(:invoice_item, created_at: Date.today)
    create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/find?created_at=#{invoice_item_1.created_at}"
    served_invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoice_item[:id]).to eq(invoice_item_1.id)

  end

end
