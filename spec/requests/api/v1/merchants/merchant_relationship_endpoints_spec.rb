require 'rails_helper'

describe "User rquests merchant relationships" do

  it "returns a list of items associated with a merchant" do
    merchant = create(:merchant)
    items = create_list(:item, 3)
    items = create_list(:item, 2, merchant: merchant)

    get "/api/v1/merchants/#{merchant.id}/items"

    served_items = JSON.parse(response.body, serialize_names: true)

    expect(response).to be success

    expect(served_items.count).to eq(2)
    expect(served_items[0][:id]). to eq(Item.first.id)
    expect(served_items[1][:id]). to eq(Item.last.id)


  end



end



# GET /api/v1/merchants/:id/invoices
