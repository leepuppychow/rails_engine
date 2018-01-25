class Api::V1::Items::MostRevenueController < ApplicationController

  def index
    quantity = params[:quantity].to_i
    render json: Item.most_revenue(quantity)
  end

end
