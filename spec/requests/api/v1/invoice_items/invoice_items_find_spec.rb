require 'rails_helper'

describe "User searches for an invoice_item by parameters" do

  it "returns a valid invoice_item by name" do

    invoice_item_1 = create(:invoice_item, name:"Invoice_invoice_item1")

    create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/find?name=#{invoice_item_1.name}"

    served_invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoice_item[:description]).to eq(invoice_item_1.description)

  end

  it "returns a valid invoice_item by description" do

    invoice_item_1 = create(:invoice_item, description: "description for Invoice_invoice_item1")

    create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/find?description=#{invoice_item_1.description}"

    served_invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoice_item[:name]).to eq(invoice_item_1.name)

  end

  it "returns a valid invoice_item by unit_price" do

    invoice_item_1 = create(:invoice_item, unit_price: 10)

    create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/find?unit_price=#{invoice_item_1.unit_price}"

    served_invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoice_item[:name]).to eq(invoice_item_1.name)

  end

  it "returns a valid invoice_item by created_at" do

    invoice_item_1 = create(:invoice_item)

    create_list(:invoice_item, 3, created_at: Date.today)

    get "/api/v1/invoice_items/find?created_at=#{invoice_item_1.created_at}"

    served_invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoice_item[:name]).to eq(invoice_item_1.name)

  end
end
