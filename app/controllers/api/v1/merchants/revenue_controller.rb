class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    date = DateTime.parse(params[:date])
    render json: Merchant.revenue_by_date(date), serializer: TotalRevenueSerializer
  end

  private

end
