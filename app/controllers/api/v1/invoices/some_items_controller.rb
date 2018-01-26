class Api::V1::Invoices::SomeItemsController < ApplicationController

  def index
    render json: Invoice.find(params[:id]).items
  end

end
