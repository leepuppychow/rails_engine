require 'rails_helper'

describe "Customers API" do
  it "shows an index of all customers" do
    create_list(:customer, 5)

    get '/api/v1/customers.json'

    customers = JSON.parse(response.body)
    expect(customers.count).to eq 5
  end
end
