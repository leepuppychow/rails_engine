class Transaction < ApplicationRecord
  validates :credit_card_number,
            :result,
            :created_at,
            :updated_at, presence: true

  # default_scope {where(result: "success")}
  # THIS IS LIKE A CALLBACK, WHICH AFFECTS THE CREATION OF OBJECTS
  #Postgres will return entries in fastest way (not by ordered ID)
  #so you can use a default_scope (typically only use for ordering)
  default_scope { order(:id) }

  #examples:
  scope :successful, -> {where(result: "success")}
  scope :failed, -> {where(result: "failed")}

  #example of passing parameter with lambda:
  # scope :sort_by, -> (feature){order("#{feature} DESC")}

  # to access all Transactions (including failed ones)
      # do: Transaction.unscoped
  belongs_to :invoice
  has_one :customer, through: :invoice
  has_one :merchant, through: :invoice
  has_many :invoice_items, through: :invoice
end
