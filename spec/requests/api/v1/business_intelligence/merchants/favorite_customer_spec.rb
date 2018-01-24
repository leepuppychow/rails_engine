require 'rails_helper'

describe "User visits business intelligence endpoint" do

  xit "can find favorite customer" do
    merchant = create(:merchant)
    create_list(:customer, 4)
    custom_customer = create(:customer)
    create_list(:invoice, 3, customer: custom_customer, merchant: merchant)
    create(:invoice, merchant: merchant)

    get "/api/v1/merchants/#{merchant.id}/favorite_customer"
  end

end
