FactoryBot.define do
  factory :invoice do

    customer
    merchant
    status "shipped"
    created_at "2012-03-27T14:54:05.000Z"
    updated_at "2012-03-27T14:54:05.000Z"

  end
end
