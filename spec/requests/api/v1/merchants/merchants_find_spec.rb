require 'rails_helper'

describe "Merchants API" do
  it "can find a single merchant matching certain parameters" do
    merchant = create(:merchant, name: "Walmart")

    get "/api/v1/merchants/find", params: {name: "Walmart"}

    found_merchant = JSON.parse(response.body)
    expect(response).to be_success
    expect(found_merchant["id"]).to eq merchant.id

  end
end
