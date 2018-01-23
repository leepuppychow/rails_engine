FactoryBot.define do
  factory :item do
    sequence(:name)  {|n| "Name#{n}" }
    sequence(:description)  {|n| "Description for Item Name#{n}" }
    unit_price 100
    merchant
    created_at "2012-03-27T14:54:05.000Z"
    updated_at "2012-03-27T14:54:05.000Z"
  end
end
