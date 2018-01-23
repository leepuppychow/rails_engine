class AddFKtoInvoices < ActiveRecord::Migration[5.1]
  def change
    add_reference :invoices, :customers, index: true, foreign_key: true
    add_reference :invoices, :merchants, index: true, foreign_key: true
  end
end
