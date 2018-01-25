class Item < ApplicationRecord
    validates :name, :description, :unit_price, :merchant_id, :created_at, :updated_at, presence: true
    default_scope {order(:id)}

    belongs_to :merchant
    has_many :invoice_items
    has_many :invoices, through: :invoice_items
    has_many :customers, through: :invoices
    has_many :transactions, through: :invoices

    def self.top_items_by_revenue(quantity)
      unscoped
        .select("items.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
        .joins(:invoice_items)
        .group(:id)
        .order("revenue DESC")
        .limit(quantity)
    end

    def self.top_items_by_count(quantity)
      unscoped
      .select("items.*, SUM(quantity) AS total_items")
      .joins(:invoice_items)
      .group(:id)
      .order("total_items DESC")
      .limit(quantity)
    end



end
