class Api::V1::Items::SearchController < ApplicationController

  def index
    render json: Item.where(search_params)
  end

  def show
    # binding.pry
    render json: Item.find_by(search_params)
  end



  private

    def search_params
      params[:unit_price] = (params[:unit_price].to_f * 100).round if params[:unit_price]
      params.permit(:id, :name, :description, :unit_price, :created_at, :updated_at, :merchant_id)
    end

end
