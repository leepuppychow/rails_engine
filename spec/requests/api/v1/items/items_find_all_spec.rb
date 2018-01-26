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

  it "returns a list of valid items by description" do

    create(:item, description:"description for Item")
    create(:item, description:"description for Item")
    create_list(:item, 3)

    get "/api/v1/items/find_all?description=#{Item.first.description}"

    served_items = JSON.parse(response.body, symbolize_names: true)

    expect(served_items.count).to eq(2)

  end

  it "returns a list of valid items by unit price" do

    create(:item, unit_price: 777)
    create(:item, unit_price: 777)

    create_list(:item, 3)

    get "/api/v1/items/find_all?unit_price=7.77"

    served_items = JSON.parse(response.body, symbolize_names: true)

    expect(served_items.count).to eq(2)

  end

  it "returns a list of valid items by created_at" do

    sad_item = create(:item, created_at: Date.today + 1)

    create_list(:item, 3)

    get "/api/v1/items/find_all?created_at=#{Item.last.created_at}"

    served_items = JSON.parse(response.body, symbolize_names: true)

    expect(served_items.count).to eq(3)

  end
end
