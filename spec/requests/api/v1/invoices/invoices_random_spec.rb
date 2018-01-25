require 'rails_helper'

describe "User searches for an invoice by random" do

  it "returns a random invoice" do

    invoices = create_list(:invoice, 3)

    get "/api/v1/invoices/random"

    served_invoice = JSON.parse(response.body, symbolize_names: true)
# binding.pry
    expect(served_invoice).to have_key(:id)

  end

end
