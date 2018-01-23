class ChangeColumnNamesInvoices < ActiveRecord::Migration[5.1]
  def change
    rename_column :invoices, :customers_id, :customer_id
    rename_column :invoices, :merchants_id, :merchant_id


  end
end
