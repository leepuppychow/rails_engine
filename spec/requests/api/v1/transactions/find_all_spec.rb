require 'rails_helper'

describe "Merchant API" do
  it "can find all merchants meeting certain parameters" do
    invoice = create(:invoice)
    invoice2 = create(:invoice)
    transaction1, transaction2, transaction3 = create_list(:transaction, 3, invoice: invoice)
    transaction4 = Transaction.create!(result: "failed",
                                created_at: "2018-03-27 14:54:05 UTC",
                                updated_at: "2018-03-27 14:54:05 UTC",
                                credit_card_number: 1234,
                                invoice: invoice2)

    get "/api/v1/transactions/find_all", params: {result: "success"}

    expect(response).to be_success
    found_transactions = JSON.parse(response.body)

    expect(found_transactions.count).to eq 3
    expect(found_transactions[0]["id"]).to eq transaction1.id
    expect(found_transactions[1]["id"]).to eq transaction2.id
    expect(found_transactions[2]["id"]).to eq transaction3.id

    get "/api/v1/transactions/find_all", params: {created_at: "2012-03-27T14:54:05.000Z"}

    expect(response).to be_success
    found_transactions = JSON.parse(response.body)

    expect(found_transactions.count).to eq 3
    expect(found_transactions[0]["id"]).to eq transaction1.id
    expect(found_transactions[1]["id"]).to eq transaction2.id
    expect(found_transactions[2]["id"]).to eq transaction3.id

    get "/api/v1/transactions/find_all", params: {updated_at: "2012-03-27T14:54:05.000Z"}

    expect(response).to be_success
    found_transactions = JSON.parse(response.body)

    expect(found_transactions.count).to eq 3
    expect(found_transactions[0]["id"]).to eq transaction1.id
    expect(found_transactions[1]["id"]).to eq transaction2.id
    expect(found_transactions[2]["id"]).to eq transaction3.id

    get "/api/v1/transactions/find_all", params: {credit_card_number: 123456789011 }

    expect(response).to be_success
    found_transactions = JSON.parse(response.body)

    expect(found_transactions.count).to eq 3
    expect(found_transactions[0]["id"]).to eq transaction1.id
    expect(found_transactions[1]["id"]).to eq transaction2.id
    expect(found_transactions[2]["id"]).to eq transaction3.id

    get "/api/v1/transactions/find_all", params: {invoice_id: invoice.id}

    expect(response).to be_success
    found_transactions = JSON.parse(response.body)
    expect(found_transactions.count).to eq 3
    expect(found_transactions[0]["id"]).to eq transaction1.id
    expect(found_transactions[1]["id"]).to eq transaction2.id
    expect(found_transactions[2]["id"]).to eq transaction3.id
  end
end
