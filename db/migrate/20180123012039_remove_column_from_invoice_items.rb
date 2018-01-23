class RemoveColumnFromInvoiceItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :invoice_items, :item_id, :integer
    remove_column :invoice_items, :invoice_id, :integer 
  end
end
