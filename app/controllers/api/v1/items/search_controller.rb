class Api::V1::Items::SearchController < ApplicationController

  def index
    render json: Item.where(params[:search_params])
  end



  private

    
end
