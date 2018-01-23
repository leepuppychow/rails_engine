require 'rails_helper'

describe "User searches for an item by parameters" do

  it "returns a valid item by name" do

    item_1 = create(:item, name:"Item1")

    create_list(:item, 3)

    get "/api/v1/items/find?name=#{item_1.name}"

    served_item = JSON.parse(response.body, symbolize_names: true)

    expect(served_item[:description]).to eq(item_1.description)

  end

  it "returns a valid item by description" do

    item_1 = create(:item, description: "description for Item1")

    create_list(:item, 3)

    get "/api/v1/items/find?description=#{item_1.description}"

    served_item = JSON.parse(response.body, symbolize_names: true)

    expect(served_item[:name]).to eq(item_1.name)

  end

  it "returns a valid item by unit_price" do

    item_1 = create(:item, unit_price: 10)

    create_list(:item, 3)

    get "/api/v1/items/find?unit_price=#{item_1.unit_price}"

    served_item = JSON.parse(response.body, symbolize_names: true)

    expect(served_item[:name]).to eq(item_1.name)

  end

  it "returns a valid item by created_at" do

    item_1 = create(:item)

    create_list(:item, 3, created_at: Date.today)

    get "/api/v1/items/find?created_at=#{item_1.created_at}"

    served_item = JSON.parse(response.body, symbolize_names: true)

    expect(served_item[:name]).to eq(item_1.name)

  end
end
