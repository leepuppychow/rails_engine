GET /api/v1/merchants/revenue?date=x

returns the total revenue for DATE x across all merchants


Merchant.joins(:invoice_items).where(invoice_items: {updated_at: "2012-03-27 14:54:09 UTC"}).sum("invoice_items.quantity * invoice_items.unit_price")
