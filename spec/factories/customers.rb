FactoryBot.define do
  factory :customer do
    sequence(:first_name) {|n| "#{n}Customer"}
    sequence(:last_name) {|n| "Customer#{n}"}
    created_at Date.today
    updated_at Date.today
  end
end
