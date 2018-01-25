class Customer < ApplicationRecord
  validates :first_name, :last_name, :created_at, :updated_at, presence: true
  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices


  def favorite_merchant
    merchants
    .select("merchants.*, COUNT(*) AS count_all")
    .joins(:transactions)
    .merge(Transaction.unscoped.success)
    .group("merchants.id")
    .unscope(:order)
    .order("count_all DESC")
    .limit(1)
  end


end
