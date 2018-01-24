require 'rails_helper'

describe "Transactions API" do
  it "shows an index of all transactions" do
    create_list(:transaction, 5)

    get '/api/v1/transactions.json'

    expect(response).to be_success

    transactions = JSON.parse(response.body)
    expect(transactions.count).to eq 5
  end
end
