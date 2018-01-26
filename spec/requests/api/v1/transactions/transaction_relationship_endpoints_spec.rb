require 'rails_helper'

describe "User requests invoice for a transaction" do

  it "returns an invoice" do

    invoice = create(:invoice)
    create(:transaction, invoice: invoice)
    create(:transaction)

    get "/api/v1/transactions/#{transaction.id}/invoice"
    served_invoice = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(served_invoice.first[:id]).to eq(invoice.id)


  end
end
