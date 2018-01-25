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
        # .joins(:invoice_items, invoices: :transactions)
        # .merge(Transaction.unscoped.success)
        .group(:id)
        .order("revenue DESC")
        .limit(quantity)
    end

    def self.top_items_by_count(quantity)
      unscoped
      .select("items.*, SUM(quantity) AS total_items")
      .joins(:invoice_items)
      # .joins(:invoice_items, invoices: :transactions)
      # .merge(Transaction.unscoped.success)
      .group(:id)
      .order("total_items DESC")
      .limit(quantity)
    end

    def best_day
       invoice_items
       .joins(invoice: :transactions)
       .merge(Transaction.unscoped.success)
       .group("invoices.updated_at")
       .order(" sum_invoice_items_quantity_all_invoice_items_unit_price DESC, invoices.updated_at DESC")
       .limit(1)
       .sum("invoice_items.quantity * invoice_items.unit_price")
       #this returns a tie, but limiting by one returns the most recent date with is not what matches the spec.
     end


end
