GET /api/v1/merchants/revenue?date=x

returns the total revenue for DATE x across all merchants

table needs:
date | revenue (sum)
joins(invoices: :invoice_items)
order by revenue
where updated_at: date
.sum(invoice_items.quantity * invoice_items.unit_price)

I need to return a number. so .sum at the end!

Merchant.joins(:invoice_items).where(invoice_items: {updated_at: "2012-03-27T14:54:05.000Z"}).sum("invoice_items.quantity * invoice_items.unit_price")



other ex:
Merchant.joins(:invoice_items)
 .group("merchants.id")
 .order("sum_invoice_items_quantity")
 .limit(params[:quantity])
 .sum("invoice_items.quantity")
