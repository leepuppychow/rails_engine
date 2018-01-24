class Merchant < ApplicationRecord
  validates :name, :created_at, :updated_at, presence: true
  default_scope {order(:id)}

  has_many :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  has_many :items
  has_many :invoice_items, through: :items

  def favorite_customer
    #returns the customer who has conducted the
    #most total number of successful transactions.
    customers
      .joins(invoices: :transactions)
      .group("customers.id")
      .order("COUNT(transactions) DESC").first
  end


  def self.revenue_by_date(date)
    joins(:invoice_items).where(invoice_items: {updated_at: date}).sum("invoice_items.quantity * invoice_items.unit_price")
  end

end
