require 'rails_helper'

describe "User makes request from Merchants" do


  it "returns total revenue for a single merchant  " do
    merchant = create(:merchant)
    invoice = create(:invoice, merchant: merchant)
    create(:invoice_item, invoice: invoice, quantity: 5, unit_price: 7777)
    create(:transaction, invoice: invoice)

    get "/api/v1/merchants/#{merchant.id}/revenue"

    revenue =  JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_success

  end

  it "returns the customer with most transactions " do
    customer_1 = create(:customer)
    customer_2 = create(:customer)
    merchant = create(:merchant)

    item = create(:item)
    invoices = create_list(:invoice, 3, customer: customer_1, merchant: merchant, created_at: "2012-03-27T14:54:05.000Z")
    create(:invoice, customer: customer_2, merchant: merchant)


    invoice_item_1 = create(:invoice_item, item: item, invoice: invoices[0])
    invoice_item_2 = create(:invoice_item, item: item, invoice: invoices[1])
    invoice_item_3 = create(:invoice_item, item: item, invoice: invoices[2])



    transactions = create(:transaction, invoice: invoices[0])
    transactions = create(:transaction, invoice: invoices[1])
    transactions = create(:transaction, invoice: invoices[2])

    get "/api/v1/merchants/#{merchant.id}/favorite_customer"

    fave_customer =  JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_success
    expect(fave_customer[:id]).to eq(customer_1.id)



  end





end
