class AddFKtoInvoiceItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :invoice_items, :item, index: true, foreign_key: true
    add_reference :invoice_items, :invoice, index: true, foreign_key: true

  end
end
