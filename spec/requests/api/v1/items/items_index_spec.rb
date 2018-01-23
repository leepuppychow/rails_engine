require 'rails_helper'

describe "Item Index API" do
  it "returns a list of all items" do
    create_list(:item, 3)

    get "/api/v1/items"

    items = JSON.parse(response.body)

    expect(response).to be_successful
    expect(items.count).to eq(3)

  end



end
