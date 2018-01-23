merchant_1 = Merchant.create(name: "Merchant1", created_at: Time.now, updated_at: Time.now)

customer_1 = Customer.create(first_name: "FN1",last_name: "LN1", created_at: Time.now, updated_at: Time.now)

invoice_1 = Invoice.create(status: "paid", merchant: merchant_1, customer: customer_1,created_at: Time.now, updated_at: Time.now)

item_1 = Item.create(name: "Item1", description: "Description of item 1", unit_price: 100, created_at: Time.now, updated_at: Time.now, merchant: merchant_1)

item_invoice
#invoice_1.items.create() or invoice_1.items << item_1
#item.invoices.create() or item_1.invoices << invoice_1


transaction_1 = Transaction.create(credit_card_number: "4444555566667777", credit_card_expiration_date: Time.now, result: "success", created_at: Time.now, updated_at: Time.now, invoice: invoice_1)
