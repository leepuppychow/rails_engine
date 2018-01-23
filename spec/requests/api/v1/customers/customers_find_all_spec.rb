require 'rails_helper'

describe "Customer API" do
  it "can find all customers by specific parameters" do
    customer1 = Customer.create!(first_name: "Joey",
                                last_name: "Ondricka",
                                created_at: "2012-03-27 14:54:09 UTC",
                                updated_at: "2012-03-27 14:54:09 UTC")
    customer2 = Customer.create!(first_name: "Joey",
                                last_name: "Ondricka",
                                created_at: "2012-03-27 14:54:09 UTC",
                                updated_at: "2012-03-27 14:54:09 UTC")
    customer3 = Customer.create!(first_name: "Joey",
                                last_name: "Ondricka",
                                created_at: "2012-03-27 14:54:09 UTC",
                                updated_at: "2012-03-27 14:54:09 UTC")
    customer4 = Customer.create!(first_name: "Sarah",
                                last_name: "Ona",
                                created_at: "2012-04-27 14:54:09 UTC",
                                updated_at: "2012-04-27 14:54:09 UTC")

    get "/api/v1/customers/find_all", params: {first_name: "Joey"}
    found_customers = JSON.parse(response.body)
    expect(found_customers.count).to eq 3

    get "/api/v1/customers/find_all", params: {last_name: "Ondricka"}
    found_customers = JSON.parse(response.body)
    expect(found_customers.count).to eq 3

    get "/api/v1/customers/find_all", params: {created_at: "2012-03-27T14:54:09.000Z"}
    found_customers = JSON.parse(response.body)
    expect(found_customers.count).to eq 3

    get "/api/v1/customers/find_all", params: {updated_at: "2012-03-27T14:54:09.000Z"}
    found_customers = JSON.parse(response.body)
    expect(found_customers.count).to eq 3
  end
end
