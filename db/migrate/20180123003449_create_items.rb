class CreateItems < ActiveRecord::Migration[5.1]
  enable_extension 'citext'

  def change
    create_table :items do |t|
      t.citext :name
      t.citext :description
      t.integer :unit_price
      t.integer :merchant_id

      t.timestamps
    end
  end
end
