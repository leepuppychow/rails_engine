require 'rails_helper'

describe "Customers API" do
  it "can see one individual customer based on id" do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"

    expect(response).to be_success
    customer = JSON.parse(response.body)

    expect(customer["id"]).to eq id 
  end
end
