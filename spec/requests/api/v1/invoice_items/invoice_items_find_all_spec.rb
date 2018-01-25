require 'rails_helper'


describe "User searches for all invoice_items by parameters" do

  it "returns a list of valid invoice_items by name" do

    create(:invoice_item, name:"Invoice_item1")
    create(:invoice_item, name:"Invoice_item1")
    create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/find_all?name=#{Invoice_item.first.name}"

    served_invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoice_items.count).to eq(2)

  end

  it "returns a list of valid invoice_items by description" do

    create(:invoice_item, description:"description for Invoice_item")
    create(:invoice_item, description:"description for Invoice_item")
    create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/find_all?description=#{Invoice_item.first.description}"

    served_invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoice_items.count).to eq(2)

  end

  it "returns a list of valid invoice_items by unit price" do

    create(:invoice_item, unit_price: 10)
    create(:invoice_item, unit_price: 10)

    create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/find_all?unit_price=#{Invoice_item.first.unit_price}"

    served_invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoice_items.count).to eq(2)

  end

  it "returns a list of valid invoice_items by created_at" do

    sad_invoice_item = create(:invoice_item, created_at: Date.today + 1)

    create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/find_all?created_at=#{Invoice_item.last.created_at}"
    # binding.pry

    served_invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoice_items.count).to eq(3)

  end
end
