require 'rails_helper'

describe "InvoiceItem Show API" do
  it "returns a single invoice item" do

    create_list(:invoice_item, 3)

    invoice_item = InvoiceItem.last

    get "/api/v1/invoice_items/#{invoice_item.id}"

    served_invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(served_invoice_item[:invoice_id]).to eq(invoice_item.invoice_id)

  end

end
