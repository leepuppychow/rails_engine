GET /api/v1/merchants/most_revenue?quantity=x
returns the top x merchants ranked by total revenue

table would be...
merchants | revenue (all their items)
joins(:invoice_items)
group by merchant
order by revenue DESC


Merchant.select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) as revenue").joins(:invoice_items).group(:merchant).order("revenue DESC").limit(2)
