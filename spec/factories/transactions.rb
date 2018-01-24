FactoryBot.define do
  factory :transaction do
    invoice
    result "success"
    credit_card_number 123456789011
    created_at "2012-03-27 14:54:05 UTC"
    updated_at "2012-03-27 14:54:05 UTC"
  end
end
