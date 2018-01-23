class Transaction < ApplicationRecord
  validates :credit_card_number,
            :result,
            :invoice_id,
            :created_at,
            :updated_at, presence: true

  belongs_to :invoice
  has_one :customer, through: :invoice
  has_one :merchant, through: :invoice
  has_many :invoice_items, through: :invoice
  
  scope :successful_transactions, -> {where(result: "success")}


end
