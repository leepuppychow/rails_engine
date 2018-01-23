FactoryBot.define do
  factory :transaction do
    invoice
    result "success"
    created_at Date.today
    updated_at Date.today
  end
end
