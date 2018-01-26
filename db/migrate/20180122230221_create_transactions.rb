class CreateTransactions < ActiveRecord::Migration[5.1]

  enable_extension 'citext'
  def change
    create_table :transactions do |t|
      t.integer :credit_card_number
      t.datetime :credit_card_expiration_date
      t.citext :result
      t.timestamps
    end
  end
end
