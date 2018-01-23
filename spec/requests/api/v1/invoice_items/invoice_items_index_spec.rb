require 'rails_helper'

describe "InvoiceItem Index API" do
  it "returns a list of all invoice_items" do

    merchant_1 = Merchant.create(name: "Merchant1", created_at: Time.now, updated_at: Time.now)
    merchant_2 = Merchant.create(name: "Merchant2", created_at: Time.now, updated_at: Time.now)
    merchant_3 = Merchant.create(name: "Merchant3", created_at: Time.now, updated_at: Time.now)
    customer_1 = Customer.create(first_name: "FN1",last_name: "LN1", created_at: Time.now, updated_at: Time.now)
    customer_2 = Customer.create(first_name: "FN2",last_name: "LN2", created_at: Time.now, updated_at: Time.now)
    customer_3 = Customer.create(first_name: "FN3",last_name: "LN3", created_at: Time.now, updated_at: Time.now)

    invoice_1 = Invoice.create(status: "paid", merchant_id: merchant_1.id, customer_id: customer_1.id,created_at: Time.now, updated_at: Time.now)
    invoice_2 = Invoice.create(status: "paid", merchant_id: merchant_2.id, customer_id: customer_2.id,created_at: Time.now, updated_at: Time.now)
    invoice_3 = Invoice.create(status: "paid", merchant_id: merchant_3.id, customer_id: customer_3.id,created_at: Time.now, updated_at: Time.now)

    item_1 = Item.create(name: "Item1", description: "Description of item 1", unit_price: 100, created_at: Time.now, updated_at: Time.now, merchant: merchant_1)
    item_2 = Item.create(name: "Item2", description: "Description of item 2", unit_price: 100, created_at: Time.now, updated_at: Time.now, merchant: merchant_1)

    invoice_1.items << [item_1, item_1]
    invoice_2.items << [item_2, item_1]
    invoice_3.items << [item_2, item_2]

    get "/api/v1/invoice_items"

    served_invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(served_invoice_items.count).to eq(3)

  end

end
