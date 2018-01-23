FactoryBot.define do
  factory :invoice_item do

    sequence(:id)  {|n| "#{n}" }
    invoice
    item
    quantity 1
    unit_price 100
    created_at "2012-03-27T14:54:05.000Z"
    updated_at "2012-03-27T14:54:05.000Z"

  end
end
