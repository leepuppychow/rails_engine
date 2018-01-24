require 'rails_helper'

describe "Transaction API" do
  it "can get a single random transaction from database" do
    transaction1, transaction2, transaction3 = create_list(:transaction, 3)
    transactions_ids = [transaction1.id, transaction2.id, transaction3.id]

    get "/api/v1/transactions/random.json"

    random_transaction = JSON.parse(response.body)
    expect(response).to be_success
    expect(transactions_ids.include?(random_transaction["id"])).to eq true
  end
end
