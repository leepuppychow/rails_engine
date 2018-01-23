FactoryBot.define do
  factory :invoice_item do

    sequence(:id)  {|n| "#{n}" }
    invoice
    item
    quantity 1
    unit_price 100
    created_at Date.today
    updated_at Date.today

  end
end
