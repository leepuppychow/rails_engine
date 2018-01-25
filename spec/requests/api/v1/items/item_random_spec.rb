require 'rails_helper'

describe "User searches for an item by random" do

  it "returns a random item" do

    items = create_list(:item, 3)

    get "/api/v1/items/random"
    expect(response).to be_success

    served_item = JSON.parse(response.body, symbolize_names: true)
# binding.pry
    expect(served_item).to have_key(:id)

  end

end
