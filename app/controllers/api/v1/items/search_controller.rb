class Api::V1::Items::SearchController < ApplicationController

  def index
    render json: Item.where(params[:search_params])
  end



  private

    def search_params
      params.permit(:name, :description, :unit_price, :create_at, :updated_at, :merchant_id)
    end

end
