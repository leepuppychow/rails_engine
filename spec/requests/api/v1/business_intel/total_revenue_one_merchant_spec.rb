# NOTE: Failed charges should never be counted in revenue totals or statistics.
#
# NOTE: All revenues should be reported as a float with two decimal places.



# GET /api/v1/merchants/:id/revenue
# Returns the total revenue for that merchant across successful transactions

    #may need to do some processing with the currency value (number_to_currency)
merchant.invoice_items
  .joins(:transactions)
  .sum("quantity * invoice_items.unit_price")

# GET /api/v1/merchants/:id/revenue?date=x
# returns the total revenue for that merchant for a specific invoice date x

merchant.invoice_items
  .joins(:invoice)
  .where("invoices.created_at = ?", params[:date])
  .sum("quantity * invoice_items.unit_price")

  #merchant_id_one = 30; date = "2012-03-16"; revenue should be 1518.84
  #need to check for date formatting (maybe use a date range in the where statement)
  #this works, but just need to work on the date formatting/searching

# GET /api/v1/merchants/most_items?quantity=x
# returns the top x merchants ranked by total number of items sold
Merchant.joins(:invoice_items).group("merchants.id").order("sum_invoice_items_quantity DESC").limit(params[:quantity]).sum("invoice_items.quantity")

  #fails when spec_harness asks for the top 8; merchant with ID 58 not showing up
  #I Think due to the failed charges (need to filter for failing Transactions)

InvoiceItem.joins(:merchant).group("merchants.id").order("sum_invoice_items_quantity DESC").limit(8).sum("invoice_items.quantity")
  #this works when you have the default scope in InvoiceItem (joining to Transactions, which are succesful)

# GET /api/v1/customers/:id/favorite_merchant
# returns a merchant where the customer has conducted the most successful transactions
customer.merchants
  .select("merchants.id, merchants.name, COUNT(*) AS count_all")
  .joins(:transactions)
  .group("merchants.id")
  .order("count_all DESC")
  .limit(1)

  #this works

# GET /api/v1/items/:id/best_day
# returns the date with the most sales for the given item using the invoice date.
# If there are multiple days with equal number of sales, return the most recent day.

item.invoices.group("invoices.created_at").order("sum_quantity DESC, invoices.created_at DESC").limit(1).sum(:quantity)

      # item_id_one  = 1099 => "2012-03-22T03:55:09.000Z"
      # item_id_two  = 2198 => "2012-03-20T23:57:05.000Z"

      #fails for 1099 (has to be most recent)
      #passes for item 2198
item.transactions
  .joins(:invoice_items)
  .group("invoices.created_at")
  .order("sum_invoice_items_quantity DESC, invoices.created_at DESC")
  .limit(1).sum("invoice_items.quantity")
# THIS WORKS

# GET /api/v1/items/most_items?quantity=x
# returns the top x item instances ranked by total number sold

item_ids = Item.joins(:invoice_items)
  .group("items.id")
  .order("sum_quantity DESC")
  .limit(params[:quantity])
  .sum(:quantity)
  .keys
  #this would return an array of the item IDs that were sold the most
  #this works, just need to return the item objects:
  Item.where(id: item_ids)
