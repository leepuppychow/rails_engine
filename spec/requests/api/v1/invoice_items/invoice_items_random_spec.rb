require 'rails_helper'

describe "User searches for an invoice_item by random" do

  it "returns a random invoice_item" do

    invoice_items = create_list(:invoice_item, 3)
    get "/api/v1/invoice_items/random"

    served_invoice_item = JSON.parse(response.body, symbolize_names: true)
    expect(served_invoice_item).to have_key(:id)

  end

end
