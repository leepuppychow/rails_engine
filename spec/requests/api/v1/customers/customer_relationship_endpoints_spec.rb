require 'rails_helper'

describe "User requests customer relationships" do

  it "returns a list of invoices associated with a customer" do
    customer = create(:customer)
    create_list(:invoice, 2, customer: customer)
    create_list(:invoice, 3)

    get "/api/v1/customers/#{customer.id}/invoices"

    served_invoices = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_success

    expect(served_invoices.count).to eq(2)
    expect(served_invoices[0][:id]). to eq(Invoice.first.id)
    expect(served_invoices[1][:id]). to eq(Invoice.second.id)

  end

  it "returns a list of transactions associated with a customer" do
    customer = create(:customer)
    invoices = create_list(:invoice, 2, customer: customer)
    transaction_1 = create(:transaction, invoice: invoices[0])
    transaction_2 = create(:transaction, invoice: invoices[1])

    get "/api/v1/customers/#{customer.id}/transactions"
    served_transactions = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_success

    expect(served_transactions.count).to eq(2)
    expect(served_transactions[0][:id]). to eq(transaction_1.id)
    expect(served_transactions[1][:id]). to eq(transaction_2.id)

  end

end
