
# GET /api/v1/merchants/:id/revenue
# Returns the total revenue for that merchant across successful transactions

    #may need to do some processing with the currency value (number_to_currency)
Merchant.first.invoice_items.merge(Transaction.unscoped.success).sum("invoice_items.quantity * invoice_items.unit_price")

def revenue
  invoice_items.joins(invoice: :transactions).sum("invoice_items.quantity * invoice_items.unit_price")
end

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
Merchant.joins(invoice: [:invoice_items, :transactions]).group(:id).merge(Transaction.unscoped.success).order("sum_invoice_items_quantity DESC").limit(3).sum("invoice_items.quantity")

Merchant.unscoped.select("merchants.*, SUM(invoice_items.quantity) AS quantity").joins(invoices: [:invoice_items, :transactions]).merge(Transaction.unscoped.success).order("quantity DESC").group(:id).limit(8)


  #fails when spec_harness asks for the top 8; merchant with ID 58 not showing up
  #I Think due to the failed charges (need to filter for failing Transactions)

InvoiceItem.joins(:merchant).group("merchants.id").order("sum_invoice_items_quantity DESC").limit(8).sum("invoice_items.quantity")
  #this works when you have the default scope in InvoiceItem (joining to Transactions, which are succesful)





# GET /api/v1/customers/:id/favorite_merchant
# returns a merchant where the customer has conducted the most successful transactions
customer.merchants.select("merchants.id, merchants.name, COUNT(*) AS count_all").joins(:transactions).merge(Transaction.unscoped.success).group("merchants.id").order("count_all DESC").limit(1)


customer.
  #this works
___________________________________________________
# GET /api/v1/items/:id/best_day
# returns the date with the most sales for the given item using the invoice date.
# If there are multiple days with equal number of sales, return the most recent day.

item.invoices.group("invoices.created_at").order("sum_quantity DESC, invoices.created_at DESC").limit(1).sum(:quantity)

      # item_id_one  = 1099 => "2012-03-22T03:55:09.000Z"
      # item_id_two  = 2198 => "2012-03-20T23:57:05.000Z"

      #fails for 1099 (has to be most recent)
      #passes for item 2198





 item.invoice_items.joins(invoice: :transactions).merge(Transaction.unscoped.success).group("invoices.updated_at").order(" sum_invoice_items_quantity_all_invoice_items_unit_price DESC, invoices.updated_at DESC").limit(3).sum("invoice_items.quantity * invoice_items.unit_price")

# THIS WORKS

-------------------------------
GET /api/v1/merchants/most_revenue?quantity=x
returns the top x merchants ranked by total revenue


limit(x)
order by revenue


Merchant.unscoped.select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue").joins(invoices: [:invoice_items, :transactions]).merge(Transaction.unscoped.success).group(:id).order("revenue DESC").limit(3)
--------------------------


GET /api/v1/customers/:id/favorite_merchant
returns a merchant where the customer has conducted the most successful transactions






customer.invoices.joins(:transactions, :merchant).merge(Transaction.unscoped.success)

# this worked for one customer but not both
customer.merchants.select("merchants.*, COUNT(*) AS count_all").joins(:transactions).merge(Transaction.unscoped.success).group("merchants.id").unscope(:order).order("count_all DESC").limit(1)


------------------------------

boss mode

BOSS MODE: GET /api/v1/merchants/:id/customers_with_pending_invoices

returns a collection of customers which have pending (unpaid) invoices. A pending invoice has no transactions with a result of success. This means all transactions are failed.

Postgres has an EXCEPT operator that might be useful. ActiveRecord also has a find_by_sql that might help.


Transaction.group(:invoice_id).unscope(:order).failed




Transaction.group(:invoice_id, :id).unscope(:order).failed.count.count (returns 947 fails)

Merchant.first.customers.select("customers.*, invoices.*, transaction.result").joins(invoices: :transactions).merge(Invoice.pending_invoices)


starts with...






...
