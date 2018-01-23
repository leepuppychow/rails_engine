require 'rails_helper'

describe "Invoice Index API" do
  it "returns a list of all invoices" do

    create_list(:invoice, 3)

    get "/api/v1/invoices"

    invoices = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoices.count).to eq(3)

  end

end
