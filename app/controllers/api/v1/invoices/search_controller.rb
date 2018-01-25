class Api::V1::Invoices::SearchController < ApplicationController

  def show
    render json: Invoice.find_by(search_params) if search_params
  end

  def index
    render json: Invoice.where(search_params) if search_params
  end


  private

    def search_params
      params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
    end
end
