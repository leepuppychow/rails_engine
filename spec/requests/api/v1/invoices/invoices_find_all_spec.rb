require 'rails_helper'


describe "User searches for all invoices by parameters" do

  it "returns a list of valid invoices by id" do

    create_list(:invoice, 3)

    get "/api/v1/invoices/find_all?id=#{Invoice.first.id}"

    served_invoices = JSON.parse(response.body, symbolize_names: true)
    expect(served_invoices.count).to eq(1)

  end


  it "returns a list of valid invoices by customer_id" do
    customer = create(:customer)
    create(:invoice, customer: customer)
    create(:invoice, customer: customer)
    create_list(:invoice, 3)
    invoice_1 = Invoice.first

    get "/api/v1/invoices/find_all?customer_id=#{invoice_1.customer_id}"
    served_invoices = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoices.count).to eq(2)
    expect(served_invoices.first[:customer_id]).to eq(invoice_1.customer_id)
    expect(served_invoices.second[:customer_id]).to eq(invoice_1.customer_id)

  end

  it "returns a list of valid invoices by merchant_id" do
    merchant = create(:merchant)
    create(:invoice, merchant: merchant)
    create(:invoice, merchant: merchant)
    create_list(:invoice, 3)
    invoice_1 = Invoice.first

    get "/api/v1/invoices/find_all?merchant_id=#{invoice_1.merchant_id}"
    served_invoices = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoices.count).to eq(2)
    expect(served_invoices.first[:merchant_id]).to eq(invoice_1.merchant_id)
    expect(served_invoices.second[:merchant_id]).to eq(invoice_1.merchant_id)

  end

  it "returns a list of valid invoices by status" do

    create_list(:invoice, 3)
    invoice_1 = create(:invoice, status: "paid")

    get "/api/v1/invoices/find_all?status=#{invoice_1.status}"
    served_invoices = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoices.count).to eq(1)
    expect(served_invoices.first[:status]).to eq(invoice_1.status)

  end

  it "returns a list of valid invoices by created_at" do

    sad_invoice = create(:invoice, created_at: Date.today + 1)
    create_list(:invoice, 3)

    get "/api/v1/invoices/find_all?created_at=#{Invoice.last.created_at}"
    served_invoices = JSON.parse(response.body, symbolize_names: true)

    expect(served_invoices.count).to eq(3)
    expect(served_invoices.first[:status]).to eq(Invoice.first.status)
    expect(served_invoices.second[:status]).to eq(Invoice.second.status)
    expect(served_invoices.last[:status]).to eq(Invoice.last.status)

  end
end
