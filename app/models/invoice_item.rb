class InvoiceItem < ApplicationRecord
  validates :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at, presence: true

  # default_scope {joins(:transactions)}

  belongs_to :item
  belongs_to :invoice
  has_one :customer, through: :invoice
  has_one :merchant, through: :invoice
  has_many :transactions, through: :invoice
end
