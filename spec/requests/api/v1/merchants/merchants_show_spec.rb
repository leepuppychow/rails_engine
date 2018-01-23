require 'rails_helper'

describe "Merchants API" do
  xit "can see a specific merchant based on its ID" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}.json"

    merchant = JSON.parse(response.body)
    expect(response).to be_success
    expect(merchant["id"]).to eq id
  end
end
