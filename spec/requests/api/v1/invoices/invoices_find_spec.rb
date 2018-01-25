require 'rails_helper'

describe "User searches for an invoice by parameters" do

  it "returns a valid invoice by id" do

    invoice_1 = create(:invoice)
    create_list(:invoice, 3)

    get "/api/v1/invoices/find?id=#{invoice_1.id}"

    served_invoice = JSON.parse(response.body, symbolize_names: true)
    expect(served_invoice[:id]).to eq(invoice_1.id)

  end

  it "returns a valid invoice by customer_id" do

    create_list(:invoice, 3)
    invoice_1 = Invoice.first

    get "/api/v1/invoices/find?customer_id=#{invoice_1.customer_id}"
    served_invoice = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoice[:id]).to eq(invoice_1.id)

  end



  it "returns a valid invoice by created_at" do

    invoice_1 = create(:invoice)
    create_list(:invoice, 3, created_at: Date.today)

    get "/api/v1/invoices/find?created_at=#{invoice_1.created_at}"

    served_invoice = JSON.parse(response.body, symbolize_names: true)
    expect(served_invoice[:id]).to eq(invoice_1.id)

  end
end
