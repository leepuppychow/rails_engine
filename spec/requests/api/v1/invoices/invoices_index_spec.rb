require 'rails_helper'

describe "Invoice Index API" do
  it "returns a list of all invoices" do

    merchant_1 = Merchant.create(name: "Merchant1", created_at: Time.now, updated_at: Time.now)
    merchant_2 = Merchant.create(name: "Merchant2", created_at: Time.now, updated_at: Time.now)
    merchant_3 = Merchant.create(name: "Merchant3", created_at: Time.now, updated_at: Time.now)
    customer_1 = Customer.create(first_name: "FN1",last_name: "LN1", created_at: Time.now, updated_at: Time.now)
    customer_2 = Customer.create(first_name: "FN2",last_name: "LN2", created_at: Time.now, updated_at: Time.now)
    customer_3 = Customer.create(first_name: "FN3",last_name: "LN3", created_at: Time.now, updated_at: Time.now)

    Invoice.create(status: "paid", merchant_id: merchant_1.id, customer_id: customer_1.id,created_at: Time.now, updated_at: Time.now)
    Invoice.create(status: "paid", merchant_id: merchant_2.id, customer_id: customer_2.id,created_at: Time.now, updated_at: Time.now)
    Invoice.create(status: "paid", merchant_id: merchant_3.id, customer_id: customer_3.id,created_at: Time.now, updated_at: Time.now) 

    get "/api/v1/invoices"

    invoices = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoices.count).to eq(3)

  end

end
