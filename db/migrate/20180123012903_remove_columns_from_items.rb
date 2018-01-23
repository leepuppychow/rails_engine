class RemoveColumnsFromItems < ActiveRecord::Migration[5.1]
  def change
    remove_reference :items, :item, index: true, foreign_key: true
    remove_reference :items, :invoice, index: true, foreign_key: true
  end
end
