require 'rails_helper'

describe "Customer API" do
  it "can find a customer by specific parameters" do
    customer = Customer.create!(first_name: "Joey",
                                last_name: "Ondricka",
                                created_at: "2012-03-27 14:54:09 UTC",
                                updated_at: "2012-03-27 14:54:09 UTC")

    get "/api/v1/customers/find", params: {first_name: "Joey"}
    found_customer = JSON.parse(response.body)
    expect(found_customer["id"]).to eq customer.id

    get "/api/v1/customers/find", params: {last_name: "Ondricka"}
    found_customer = JSON.parse(response.body)
    expect(found_customer["id"]).to eq customer.id

    get "/api/v1/customers/find", params: {created_at: "2012-03-27T14:54:09.000Z"}
    found_customer = JSON.parse(response.body)
    expect(found_customer["id"]).to eq customer.id

    get "/api/v1/customers/find", params: {updated_at: "2012-03-27T14:54:09.000Z"}
    found_customer = JSON.parse(response.body)
    expect(found_customer["id"]).to eq customer.id




  end
end
