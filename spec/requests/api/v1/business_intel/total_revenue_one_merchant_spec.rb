# GET /api/v1/merchants/:id/revenue
# Returns the total revenue for that merchant across successful transactions

    #may need to do some processing with the currency value (number_to_currency)
merchant.invoice_items
  .joins(:transactions)
  .merge(Transaction.successful_transactions)
  .sum("quantity * invoice_items.unit_price")

# GET /api/v1/merchants/:id/revenue?date=x
# returns the total revenue for that merchant for a specific invoice date x

    #need to check for date formatting (maybe use a date range in the where statement)
merchant.invoice_items
  .joins(:invoice)
  .where("invoices.created_at = ?", params[:date])
  .sum("quantity * invoice_items.unit_price")


# GET /api/v1/merchants/most_items?quantity=x
# returns the top x merchants ranked by total number of items sold
Merchant.joins(:invoice_items)
  .group("merchants.id")
  .order("sum_invoice_items_quantity")
  .limit(params[:quantity])
  .sum("invoice_items.quantity")

# GET /api/v1/customers/:id/favorite_merchant
# returns a merchant where the customer has conducted the most successful transactions
customer.merchants
  .select("merchants.id, merchants.name, COUNT(*) AS count_all")
  .joins(:transactions)
  .merge(Transaction.successful_transactions)
  .group("merchants.id")
  .order("count_all DESC")
  .limit(1)

# GET /api/v1/items/:id/best_day
# returns the date with the most sales for the given item using the invoice date.
# If there are multiple days with equal number of sales, return the most recent day.


# GET /api/v1/items/most_items?quantity=x
# returns the top x item instances ranked by total number sold










####
