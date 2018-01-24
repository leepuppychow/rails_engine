class Api::V1::Transactions::SearchController < ApplicationController

  def index
    render json: Transaction.where(search_params)
  end

  def show
    render json: Transaction.find_by(search_params)
  end

  private

    def search_params
      params.permit(:credit_card_number, :result,
            :invoice_id, :created_at, :updated_at, :credit_card_expiration_date)
    end

end
