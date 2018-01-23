require 'rails_helper'

describe "Item Show API" do
  it "returns a list of all items" do
    create_list(:item, 3)
    item = Item.last

    get "/api/v1/items/#{item.id}"

    served_item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(item.name).to eq(served_item.name)

  end

end
