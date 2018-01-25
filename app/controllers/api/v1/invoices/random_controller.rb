class Api::V1::Invoices::RandomController < ApplicationController

  def show
    render json: Invoice.limit(1).order("RANDOM()").first
  end

end
