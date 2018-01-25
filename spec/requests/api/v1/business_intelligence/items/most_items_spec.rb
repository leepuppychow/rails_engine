# require 'rails_helper'
#
# describe "User visits /items/most_items" do
#   it "returns a list of items based on total number sold" do
#     create_list(:item, 10)
#
#     get '/api/v1/items/most_items?quantity=5'
#
#     items = JSON.parse(response.body)
#
#   end
# end
#
# =begin
# GET /api/v1/items/most_items?quantity=x
# returns the top x item instances ranked by total number sold (not price, #)
#
#
# select all items, SUM(invoice_items.quantity) as total most_revenue
# group it by item_id
# order it by the group count
# merge/where transactions = success
#
# L's tries:
# Item.select("items.*, SUM(invoice_items.quantity) AS total_items").joins(:invoice_items).group(:id).order("total_items DESC").limit(2)
# =end
