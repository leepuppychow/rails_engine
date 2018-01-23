FactoryBot.define do
  factory :customer do
    sequence(:first_name) {|n| "#{n}Customer"}
    sequence(:last_name) {|n| "Customer#{n}"}
    created_at "2012-03-27T14:54:05.000Z"
    updated_at "2012-03-27T14:54:05.000Z"
  end
end
