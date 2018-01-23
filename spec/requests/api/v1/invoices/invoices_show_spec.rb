require 'rails_helper'

describe "Invoice Show API" do
  it "returns a single invoice" do

    create_list(:invoice, 3)

    invoice = Invoice.last

    get "/api/v1/invoices/#{invoice.id}"

    served_invoice = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(served_invoice[:merchant_id]).to eq(invoice.merchant_id)

  end

end
