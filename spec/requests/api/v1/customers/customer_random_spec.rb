require 'rails_helper'

describe "Customer API" do
  it "can get a random customer" do
    customer1,customer2,customer3 = create_list(:customer, 3)
    customers_ids = [customer1.id, customer2.id, customer3.id]

    get "/api/v1/customers/random.json"

    expect(response).to be_success
    random = JSON.parse(response.body)
    expect(customers_ids.include?(random["id"])).to eq true 
  end
end
