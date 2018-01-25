class Api::V1::Merchants::MostItemsController < ApplicationController

  def index
    number_of_merchants = params[:quantity].to_i
    render json: Merchant.merchants_with_most_items(number_of_merchants)
  end


end
