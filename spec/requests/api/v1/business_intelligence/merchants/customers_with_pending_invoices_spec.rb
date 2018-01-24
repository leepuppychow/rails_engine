GET /api/v1/merchants/:id/customers_with_pending_invoices


returns a collection of customers which have pending (unpaid) invoices. A pending invoice has no transactions with a result of success. This means all transactions are failed. Postgres has an EXCEPT operator that might be useful. ActiveRecord also has a find_by_sql that might help.

starts in merchants, limited by id already
need to unscope Transactions  (or get around it by a where clause? but I can't if it's scoped at the model level)
table with customers.*, invoices.*, transactions.result,

ordered by transactions.result, or grouped by it

merchant.first.__
.unscoped
.select("customers.*, invoices.*, transactions.result")
.joins(invoices: [:customers, :transactions])
.group("transactions.result")

Merchant.first.unscoped.select("customers.*, invoices.*, transactions.result").joins(:customers, invoices: [:transactions]).where.not(transactions: {result: "success"})




the following returns an array of different merchants...
-------------------------------
Merchant.unscoped.select("customers.*, invoices.*, transactions.result").joins(:customers, invoices: [:transactions]).where.not(transactions: {result: "success"})
=>
SELECT  customers.*, invoices.*, transactions.result FROM "merchants" INNER JOIN "invoices" ON "invoices"."merchant_id" = "merchants"."id" INNER JOIN "customers" ON "customers"."id" = "invoices"."customer_id" INNER JOIN "invoices" "invoices_merchants" ON "invoices_merchants"."merchant_id" = "merchants"."id" INNER JOIN "transactions" ON "transactions"."invoice_id" = "invoices_merchants"."id" WHERE ("transactions"."result" != $1) LIMIT $2
=> returns an array of MERCHANTS tho...
