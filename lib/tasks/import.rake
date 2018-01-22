require 'csv'

namespace :import do
  desc 'All'
  task all: [:merchants, :customers, :items, :invoices, :transactions, :invoice_items]

    desc "Import customers CSV file"
      task :customers => [:environment] do

        CSV.foreach("./db/customers.csv", headers: true, header_converters: :symbol) do |row|
          Customer.create!(row.to_hash)

        end
      end

    desc "Import invoice_items CSV file"
      task :invoice_items => [:environment] do

        CSV.foreach("./db/invoice_items.csv", headers: true, header_converters: :symbol) do |row|
          InvoiceItem.create!(row.to_hash)

        end
      end

    desc "Import invoices CSV file"
      task :invoices => [:environment] do

        CSV.foreach("./db/invoices.csv", headers: true, header_converters: :symbol) do |row|
          Invoice.create!(row.to_hash)

        end
      end

    desc "Import merchants CSV file"
      task :merchants => [:environment] do

        CSV.foreach("./db/merchants.csv", headers: true, header_converters: :symbol) do |row|
          Merchant.create!(row.to_hash)

        end
      end

    desc "Import transactions CSV file"
      task :transactions => [:environment] do

        CSV.foreach("./db/transactions.csv", headers: true, header_converters: :symbol) do |row|
          Transaction.create!(row.to_hash)

        end
      end


end
