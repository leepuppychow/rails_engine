class RemoveColumnFromInvoices < ActiveRecord::Migration[5.1]
  def change
    remove_column :invoices, :customer_id, :integer
    remove_column :invoices, :merchant_id, :integer 
  end
end
