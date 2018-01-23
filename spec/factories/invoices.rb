FactoryBot.define do
  factory :invoice do
    customer_id
    merchant_id
    status
    created_at
    updated_at
  end
end
