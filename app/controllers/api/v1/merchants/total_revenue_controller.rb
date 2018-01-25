class Api::V1::Merchants::TotalRevenueController < ApplicationController

  def show
    if params[:date]
      date = DateTime.parse(params[:date])
      render json: Merchant.find(params[:id]).total_revenue_on_date(date)
    else
      render json: Merchant.find(params[:id]).total_revenue
    end
  end

end
