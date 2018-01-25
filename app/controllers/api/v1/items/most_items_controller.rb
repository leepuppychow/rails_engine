class Api::V1::Items::MostItemsController < ApplicationController

  def index
    render json: Item.top_items_by_count(quantity_params)
  end

  private

    def quantity_params
      params.permit(:quantity).values.first.to_i
    end

end
