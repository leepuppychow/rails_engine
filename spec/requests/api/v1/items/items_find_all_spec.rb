require 'rails_helper'

describe "User searches for all items by parameters" do

  it "returns a list of valid items by name" do

    create(:item, name:"Item1")
    create(:item, name:"Item1")
    create_list(:item, 3)

    get "/api/v1/items/find_all?name=#{Item.first.name}"

    served_items = JSON.parse(response.body, symbolize_names: true)

    expect(served_items.count).to eq(2)

  end
end
