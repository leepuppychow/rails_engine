# GET /api/v1/merchants/:id/revenue
# Returns the total revenue for that merchant across successful transactions

#this will get all the invoice items for a merchant

# InvoiceItem.select("(quantity * unit_price) AS revenue")

Merchant.joins(:invoices)
# Merchant.joins(invoices: :invoice_items )
@merchants = Merchant.all # 1 in n + 1
# 1 query
# => total of 1000 merchants n is 1000
@merchants.each do |merchant|
  merchant.invoices.each do |invoice|
    puts invoice.id
  end
end

-----------------------------------------

Merchant.includes(:invoices)
# 2 queries

@merchants.each do |merchant|
  merchant.invoices.each do |invoice|
    puts invoice.id
  end
end


# SELECT * FROM merchants
# INNER JOIN invoices ON merchants.id = invoices.merchant_id
# INNER JOIN transactions ON invoices.id = transactions.invoice_id
# WHERE transactions.result = 'success';
