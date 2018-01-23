require 'rails_helper'

describe "Invoice Show API" do
  it "returns a list of all invoices" do
    create_list(:invoice, 3)
    invoice = invoice.last

    get "/api/v1/invoices/#{invoice.id}"

    served_invoice = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(served_invoice[:name]).to eq(invoice.name)

  end

end
