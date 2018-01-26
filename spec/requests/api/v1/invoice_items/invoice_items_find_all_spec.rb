require 'rails_helper'


describe "User searches for all invoice_items by parameters" do

  it "returns a list of valid invoice_items by id" do

    create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/find_all?id=#{InvoiceItem.first.id}"
    served_invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoice_items.count).to eq(1)
    expect(served_invoice_items.first[:id]).to eq(InvoiceItem.first.id)

  end

  it "returns a list of valid invoice_items by item_id" do
    item = create(:item)
    create(:invoice_item, item: item)
    create(:invoice_item, item: item)
    create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/find_all?item_id=#{InvoiceItem.first.item_id}"
    served_invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoice_items.count).to eq(2)
    expect(served_invoice_items.first[:id]).to eq(InvoiceItem.first.id)
    expect(served_invoice_items.second[:id]).to eq(InvoiceItem.second.id)

  end

  it "returns a list of valid invoice_items by invoice_id" do
    invoice = create(:invoice)
    create(:invoice_item, invoice: invoice)
    create(:invoice_item, invoice: invoice)
    create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/find_all?invoice_id=#{InvoiceItem.first.invoice_id}"
    served_invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoice_items.count).to eq(2)
    expect(served_invoice_items.first[:id]).to eq(InvoiceItem.first.id)
    expect(served_invoice_items.second[:id]).to eq(InvoiceItem.second.id)

  end

  it "returns a list of valid invoice_items by quantity" do

    create(:invoice_item, quantity: 777)
    create(:invoice_item, quantity: 777)
    create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/find_all?quantity=#{InvoiceItem.first.quantity}"
    served_invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoice_items.count).to eq(2)
    expect(served_invoice_items.first[:id]).to eq(InvoiceItem.first.id)
    expect(served_invoice_items.second[:id]).to eq(InvoiceItem.second.id)

  end


  it "returns a list of valid invoice_items by unit_price" do

    create(:invoice_item, unit_price: 777)
    create(:invoice_item, unit_price: 777)
    create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/find_all?unit_price=7.77"
    served_invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoice_items.count).to eq(2)
    expect(served_invoice_items.first[:id]).to eq(InvoiceItem.first.id)
    expect(served_invoice_items.second[:id]).to eq(InvoiceItem.second.id)

  end


  it "returns a list of valid invoice_items by created_at" do

    create(:invoice_item, created_at: Date.today)
    create(:invoice_item, created_at: Date.today)
    create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/find_all?created_at=#{InvoiceItem.first.created_at}"
    served_invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoice_items.count).to eq(2)
    expect(served_invoice_items.first[:id]).to eq(InvoiceItem.first.id)
    expect(served_invoice_items.second[:id]).to eq(InvoiceItem.second.id)

  end


end
