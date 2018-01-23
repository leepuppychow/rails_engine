require 'rails_helper'

describe "Invoice Index API" do
  it "returns a list of all invoices" do

    merchant_1 = Merchant.create(name: "Merchant1", created_at: Time.now, updated_at: Time.now)
    merchant_2 = Merchant.create(name: "Merchant2", created_at: Time.now, updated_at: Time.now)
    merchant_3 = Merchant.create(name: "Merchant3", created_at: Time.now, updated_at: Time.now)
    customer_1 = Customer.create(first_name: "FN1",last_name: "LN1", created_at: Time.now, updated_at: Time.now)
    customer_2 = Customer.create(first_name: "FN2",last_name: "LN2", created_at: Time.now, updated_at: Time.now)
    customer_3 = Customer.create(first_name: "FN3",last_name: "LN3", created_at: Time.now, updated_at: Time.now)

    Invoice.create(status: "paid", merchant: merchant_1, customer: customer_1, created_at: Time.now, updated_at: Time.now)
    Invoice.create(status: "paid", merchant: merchant_2, customer: customer_2,created_at: Time.now, updated_at: Time.now)
    Invoice.create(status: "paid", merchant: merchant_3, customer: customer_3,created_at: Time.now, updated_at: Time.now)

    get "/api/v1/invoices"

    invoices = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoices.count).to eq(3)

  end

end
