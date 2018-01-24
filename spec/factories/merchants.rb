FactoryBot.define do
  factory :merchant do
    sequence(:name)  {|n| "Name#{n}" }
    created_at "2012-03-27T14:54:05.000Z"
    updated_at "2012-03-27T14:54:05.000Z"
  end
end
