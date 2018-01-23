class Invoice < ApplicationRecord
validates :customer_id, :merchant_id, :status, :created_at, :updated_at, presence: true

has_many :invoice_items
has_many :invoices, through: :invoice_items
belongs_to :customer
belongs_to :merchant

end
