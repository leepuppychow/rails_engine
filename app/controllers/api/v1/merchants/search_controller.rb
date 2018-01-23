class Api::V1::Merchants::SearchController < ApplicationController

  def show
    render json: Merchant.find_by(search_params) if search_params

    # render json: Merchant.find_by(name: params[:name]) if params[:name]
    # render json: Merchant.find_by(created_at: params[:created_at]) if params[:created_at]
    # render json: Merchant.find_by(updated_at: params[:updated_at]) if params[:updated_at]
  end

  def index
    render json: Merchant.where(search_params) if search_params
    # render json: Merchant.where(name: params[:name]) if params[:name]
    # render json: Merchant.where(created_at: params[:created_at]) if params[:created_at]
    # render json: Merchant.where(updated_at: params[:updated_at]) if params[:updated_at]
  end

  private

    def search_params
      #could format your params here (date, currency)
      #could create a Sanitize.new PORO to process the currency
      # params[:created_at] = DateTime.new(params[:created_at]) if params[:created_at]
      # params[:updated_at] = DateTime.new(params[:updated_at]) if params[:updated_at]
      params.permit(:name, :created_at, :updated_at)
    end
end
