class ChangeColumnNameTransactions < ActiveRecord::Migration[5.1]
  def change
    rename_column :transactions, :invoices_id, :invoice_id

  end
end
