class Api::V1::Merchants::TotalRevenueController < ApplicationController

  def show

    # GET /api/v1/merchants/:id/revenue?date=x
    if params[:date]
      date = DateTime.parse(params[:date])
      render json: Merchant.find(params[:id]).total_revenue_on_date(date)
    else
      render json: Merchant.find(params[:id]).total_revenue
    end
  end

end
