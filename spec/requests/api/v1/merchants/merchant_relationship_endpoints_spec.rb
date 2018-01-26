require 'rails_helper'

describe "User rquests merchant relationships" do

  it "returns a list of items associated with a merchant" do
    merchant = create(:merchant)
    create_list(:item, 2, merchant: merchant)
    create_list(:item, 3)

    get "/api/v1/merchants/#{merchant.id}/items"

    served_items = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_success

    expect(served_items.count).to eq(2)
    expect(served_items[0][:id]). to eq(Item.first.id)
    expect(served_items[1][:id]). to eq(Item.second.id)

  end

  it "returns a list of invoices associated with a merchant" do
    merchant = create(:merchant)
    create_list(:invoice, 2, merchant: merchant)
    create_list(:invoice, 3)

    get "/api/v1/merchants/#{merchant.id}/invoices"
# binding.pry
    served_invoices = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_success

    expect(served_invoices.count).to eq(2)
    expect(served_invoices[0][:id]). to eq(Invoice.first.id)
    expect(served_invoices[1][:id]). to eq(Invoice.second.id)

  end



end
