class InvoiceItem < ApplicationRecord
  validates :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at, presence: true
  belongs_to :item
  belongs_to :invoice
  has_one :customer, through: :invoice
  has_one :merchant, through: :invoice
  has_many :transactions, through: :invoice 


  def revenue
    quantity * unit_price
  end

end
