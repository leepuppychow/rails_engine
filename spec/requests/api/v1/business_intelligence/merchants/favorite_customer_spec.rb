GET /api/v1/merchants/:id/favorite_customer

eturns the customer who has conducted the most total number of successful transactions.

table is (customer.*, COUNT(transactions) AS total_transactions)
joins(invoices: [:customers, :transactions])
group(:customer)
order("total_transactions DESC")
.first

.customers

merchant.
