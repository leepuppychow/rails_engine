class Api::V1::Invoices::SomeInvoiceItemsController < ApplicationController

  def index
    render json: Invoice.find(params[:id]).invoice_items
  end

end
