require 'rails_helper'

describe "Merchants API" do
  it "can find a single merchant matching certain parameters" do
    merchant = Merchant.create!(name: "Walmart",
                                created_at: "2012-03-27 14:54:05 UTC",
                                updated_at: "2012-03-27 14:54:05 UTC")

    get "/api/v1/merchants/find", params: {name: "Walmart"}

    found_merchant = JSON.parse(response.body)
    expect(response).to be_success
    expect(found_merchant["id"]).to eq merchant.id

    get "/api/v1/merchants/find", params: {updated_at: "2012-03-27T14:54:05.000Z"}

    found_merchant = JSON.parse(response.body)
    expect(response).to be_success
    expect(found_merchant["id"]).to eq merchant.id

    get "/api/v1/merchants/find", params: {created_at: "2012-03-27T14:54:05.000Z"}

    found_merchant = JSON.parse(response.body)
    expect(response).to be_success
    expect(found_merchant["id"]).to eq merchant.id

  end
end
