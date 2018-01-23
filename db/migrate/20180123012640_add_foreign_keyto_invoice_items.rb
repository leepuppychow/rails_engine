class AddForeignKeytoInvoiceItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :invoice_items, :invoices, index: true, foreign_key: true
    add_reference :invoice_items, :items, index: true, foreign_key: true

  end
end
