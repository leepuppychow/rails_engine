require 'rails_helper'

describe "Transactions API" do
  it "can see a specific transaction based on its ID" do
    id = create(:transaction).id

    get "/api/v1/transactions/#{id}.json"

    transaction = JSON.parse(response.body)
    expect(response).to be_success
    expect(transaction["id"]).to eq id
  end
end
