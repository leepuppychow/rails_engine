class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    date = DateTime.parse(params[:date])
    render json: Merchant.revenue_by_date(date)
  end

  private

    # def date_params
    #   # ONLY NEED STRONG PARAMS WHEN altering table
    #   begin
    #     DateTime.parse(params[:date])
    #   rescue ArgumentError
    #     render json: {error_message: "Enter a real date..."}
    #   end
    #    # DateTime.parse(params.permit(:date).values.first)
    # end

end
