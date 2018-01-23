# GET /api/v1/merchants/:id/revenue
# Returns the total revenue for that merchant across successful transactions



SELECT * FROM merchants
INNER JOIN invoices ON merchants.id = invoices.merchant_id
INNER JOIN transactions ON invoices.id = transactions.invoice_id
WHERE transactions.result = 'success';
