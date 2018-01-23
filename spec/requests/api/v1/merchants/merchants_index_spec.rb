require 'rails_helper'

describe "Merchants API" do
  xit "shows an index of all merchants" do
    create_list(:merchant, 5)

    get '/api/v1/merchants.json'

    expect(response).to be_success

    merchants = JSON.parse(response.body)
    expect(merchants.count).to eq 5
  end
end
