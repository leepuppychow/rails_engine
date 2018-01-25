require 'rails_helper'


describe "User searches for all invoices by parameters" do

  it "returns a list of valid invoices by name" do

    create(:invoice, name:"Invoice1")
    create(:invoice, name:"Invoice1")
    create_list(:invoice, 3)

    get "/api/v1/invoices/find_all?name=#{Invoice.first.name}"

    served_invoices = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoices.count).to eq(2)

  end

  it "returns a list of valid invoices by description" do

    create(:invoice, description:"description for Invoice")
    create(:invoice, description:"description for Invoice")
    create_list(:invoice, 3)

    get "/api/v1/invoices/find_all?description=#{Invoice.first.description}"

    served_invoices = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoices.count).to eq(2)

  end

  it "returns a list of valid invoices by unit price" do

    create(:invoice, unit_price: 10)
    create(:invoice, unit_price: 10)

    create_list(:invoice, 3)

    get "/api/v1/invoices/find_all?unit_price=#{Invoice.first.unit_price}"

    served_invoices = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoices.count).to eq(2)

  end

  it "returns a list of valid invoices by created_at" do

    sad_invoice = create(:invoice, created_at: Date.today + 1)

    create_list(:invoice, 3)

    get "/api/v1/invoices/find_all?created_at=#{Invoice.last.created_at}"
    # binding.pry

    served_invoices = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoices.count).to eq(3)

  end
end
