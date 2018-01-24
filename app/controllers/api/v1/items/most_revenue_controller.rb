class Api::V1::Items::MostRevenueController < ApplicationController

  def index
    # binding.pry
    render json: Item.top_items_by_revenue(quantity_params)

    # GET /api/v1/items/most_revenue?quantity=x

  end

  private

    def quantity_params
      params.permit(:quantity).values.first.to_i
    end

end
