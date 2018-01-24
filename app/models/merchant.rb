class Merchant < ApplicationRecord
  validates :name, :created_at, :updated_at, presence: true
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  has_many :items
  has_many :invoice_items, through: :items

  def self.favorite_customer
    .customers.joins(invoices: :transactions).group("customers.id").order("COUNT(transactions) DESC").first
  end

  def revenue_by_date(date)
    Merchant.joins(:invoice_items).where(invoice_items: {updated_at: date}).sum("invoice_items.quantity * invoice_items.unit_price")

  def self.revenue_by_date(date)
    joins(:invoice_items).where(invoice_items: {updated_at: date}).sum("invoice_items.quantity * invoice_items.unit_price")
  end

end
