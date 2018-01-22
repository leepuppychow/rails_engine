class Merchant < ApplicationRecord
  validates :name, :created_at, :updated_at, presence: true 

end
