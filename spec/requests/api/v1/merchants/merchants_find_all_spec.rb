require 'rails_helper'

describe "Merchant API" do
  it "can find all merchants meeting certain parameters" do
    merchant1, merchant2, merchant3 = create_list(:merchant, 3)
    merchant4 = Merchant.create!(name: "Walmart",
                                created_at: Date.today + 1,
                                updated_at: Date.today + 1)
                                
    get "/api/v1/merchants/find_all", params: {name: "Joe"}

    expect(response).to be_success
    found_merchants = JSON.parse(response.body)

    expect(found_merchants.count).to eq 3
    expect(found_merchants[0]["id"]).to eq merchant1.id
    expect(found_merchants[1]["id"]).to eq merchant2.id
    expect(found_merchants[2]["id"]).to eq merchant3.id

    get "/api/v1/merchants/find_all", params: {created_at: "2012-03-27T14:54:05.000Z"}

    expect(response).to be_success
    found_merchants = JSON.parse(response.body)

    expect(found_merchants.count).to eq 3
    expect(found_merchants[0]["id"]).to eq merchant1.id
    expect(found_merchants[1]["id"]).to eq merchant2.id
    expect(found_merchants[2]["id"]).to eq merchant3.id

    get "/api/v1/merchants/find_all", params: {updated_at: "2012-03-27T14:54:05.000Z"}

    expect(response).to be_success
    found_merchants = JSON.parse(response.body)

    expect(found_merchants.count).to eq 3
    expect(found_merchants[0]["id"]).to eq merchant1.id
    expect(found_merchants[1]["id"]).to eq merchant2.id
    expect(found_merchants[2]["id"]).to eq merchant3.id
  end
end
