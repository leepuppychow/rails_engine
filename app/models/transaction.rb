class Transaction < ApplicationRecord
  validates :credit_card_number,
            :result,
            :invoice_id,
            :created_at,
            :updated_at, presence: true

  belongs_to :invoice

end
