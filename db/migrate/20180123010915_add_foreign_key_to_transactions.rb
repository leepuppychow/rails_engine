class AddForeignKeyToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_reference :transactions, :invoices, index: true, foreign_key: true
  end
end
