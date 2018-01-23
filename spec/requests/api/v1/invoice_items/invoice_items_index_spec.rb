require 'rails_helper'

describe "InvoiceItem Index API" do
  it "returns a list of all invoice_items" do

    create_list(:invoice_item, 3)

    get "/api/v1/invoice_items"

    served_invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(served_invoice_items.count).to eq(3)

  end

end
