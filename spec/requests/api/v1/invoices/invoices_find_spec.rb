require 'rails_helper'

describe "User searches for an invoice by parameters" do

  it "returns a valid invoice by name" do

    invoice_1 = create(:invoice, name:"Invoice1")

    create_list(:invoice, 3)

    get "/api/v1/invoices/find?name=#{invoice_1.name}"

    served_invoice = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoice[:description]).to eq(invoice_1.description)

  end

  it "returns a valid invoice by description" do

    invoice_1 = create(:invoice, description: "description for Invoice1")

    create_list(:invoice, 3)

    get "/api/v1/invoices/find?description=#{invoice_1.description}"

    served_invoice = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoice[:name]).to eq(invoice_1.name)

  end

  it "returns a valid invoice by unit_price" do

    invoice_1 = create(:invoice, unit_price: 10)

    create_list(:invoice, 3)

    get "/api/v1/invoices/find?unit_price=#{invoice_1.unit_price}"

    served_invoice = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoice[:name]).to eq(invoice_1.name)

  end

  it "returns a valid invoice by created_at" do

    invoice_1 = create(:invoice)

    create_list(:invoice, 3, created_at: Date.today)

    get "/api/v1/invoices/find?created_at=#{invoice_1.created_at}"

    served_invoice = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoice[:name]).to eq(invoice_1.name)

  end
end
