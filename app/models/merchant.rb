class Merchant < ApplicationRecord
  validates :name, :created_at, :updated_at, presence: true
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  
  has_many :items
  has_many :invoice_items, through: :items

end
