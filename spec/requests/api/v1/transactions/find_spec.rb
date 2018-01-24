require 'rails_helper'

describe "Transactions API" do
  it "can find a single transaction matching certain parameters" do
    invoice = create(:invoice)
    transaction = Transaction.create!(result: "success",
                                created_at: "2012-03-27 14:54:05 UTC",
                                updated_at: "2012-03-27 14:54:05 UTC",
                                credit_card_number: 1234,
                                invoice: invoice)

    get "/api/v1/transactions/find", params: {result: "success"}

    found_transaction = JSON.parse(response.body)
    expect(response).to be_success
    expect(found_transaction["id"]).to eq transaction.id

    get "/api/v1/transactions/find", params: {updated_at: "2012-03-27T14:54:05.000Z"}

    found_transaction = JSON.parse(response.body)
    expect(response).to be_success
    expect(found_transaction["id"]).to eq transaction.id

    get "/api/v1/transactions/find", params: {created_at: "2012-03-27T14:54:05.000Z"}

    found_transaction = JSON.parse(response.body)
    expect(response).to be_success
    expect(found_transaction["id"]).to eq transaction.id

    get "/api/v1/transactions/find", params: {credit_card_number: 1234}

    found_transaction = JSON.parse(response.body)
    expect(response).to be_success
    expect(found_transaction["id"]).to eq transaction.id

    get "/api/v1/transactions/find", params: {invoice_id: invoice.id}

    found_transaction = JSON.parse(response.body)
    expect(response).to be_success
    expect(found_transaction["id"]).to eq transaction.id

  end
end
