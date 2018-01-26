require 'rails_helper'

describe Merchant do
  describe "Validations" do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_presence_of(:created_at)}
    it {is_expected.to validate_presence_of(:updated_at)}
  end

  describe "Relationships" do
    it {is_expected.to have_many(:items)}
    it {is_expected.to have_many(:invoices)}
    it {is_expected.to have_many(:customers).through(:invoices)}
  end
end
