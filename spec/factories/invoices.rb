FactoryBot.define do
  factory :invoice do
    customer 
    merchant
    status "shipped"
    created_at Time.now
    updated_at Time.now
  end
end
