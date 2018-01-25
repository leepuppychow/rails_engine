#
#
# GET /api/v1/items/:id/best_day
#
# table with all items, column of revenue
# grouped by date (invoice date)
# ordered by revenue, then date
# limit 1
#
# Items.select(items.*, SUM(invoice_items.quantity *
