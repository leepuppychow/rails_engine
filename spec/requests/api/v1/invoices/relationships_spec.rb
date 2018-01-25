require 'rails_helper'

describe "Invoices API" do

  it "can get all transactions linked to one invoice" do
    customer = create(:customer)
    invoice = create(:invoice, customer: customer)
    create_list(:transaction, 5, invoice: invoice)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    expect(response).to be_success
    transactions = JSON.parse(response.body)
    expect(transactions.count).to eq 5
  end

  it "can get invoice items for one invoice" do
    customer = create(:customer)
    invoice = create(:invoice, customer: customer)
    create_list(:invoice_item, 4, invoice: invoice)

    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    expect(response).to be_success
    invoice_items = JSON.parse(response.body)
    expect(invoice_items.count).to eq 4
  end

  it "can get items for one invoice" do
    customer = create(:customer)
    invoice = create(:invoice, customer: customer)
    item1 = create(:item)
    item2 = create(:item)
    create(:invoice_item, invoice: invoice, item: item1)
    create(:invoice_item, invoice: invoice, item: item2)

    get "/api/v1/invoices/#{invoice.id}/items"

    items = JSON.parse(response.body)
    expect(items.count).to eq 2
  end

  it "can get the customer for one invoice" do
    invoice = create(:invoice)
    c = create(:customer)
    c.invoices << invoice

    get "/api/v1/invoices/#{invoice.id}/customer"

    customer = JSON.parse(response.body)
    expect(customer["id"]).to eq c.id
  end

  it "can get the merchant for one invoice" do
    invoice = create(:invoice)
    merchant = create(:merchant)
    merchant.invoices << invoice

    get "/api/v1/invoices/#{invoice.id}/merchant"

    found_merchant = JSON.parse(response.body)
    expect(found_merchant["id"]).to eq merchant.id
  end


end
