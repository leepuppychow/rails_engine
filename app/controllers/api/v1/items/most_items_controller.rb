class Api::V1::Items::MostItemsController < ApplicationController

  def index
    quantity = params[:quantity].to_i
    render json: Item.most_items(quantity)
  end



end
