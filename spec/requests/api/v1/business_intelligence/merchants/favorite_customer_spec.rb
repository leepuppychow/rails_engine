GET /api/v1/merchants/:id/favorite_customer

Merchant.first.customers.joins(invoices: :transactions).group("customers.id").order("COUNT(transactions) DESC").first
