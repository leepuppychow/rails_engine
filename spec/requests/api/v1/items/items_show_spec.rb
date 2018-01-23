require 'rails_helper'

describe "Item Show API" do
  it "returns a single item" do
    create_list(:item, 3)
    item = Item.last

    get "/api/v1/items/#{item.id}"

    served_item = JSON.parse(response.body, symbolize_names: true)
binding.pry
    expect(response).to be_successful
    expect(served_item[:name]).to eq(item.name)

  end

end
