require 'rails_helper'

describe Merchant do
  describe "Validations" do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_presence_of(:created_at)}
    it {is_expected.to validate_presence_of(:updated_at)}
  end

  # describe "Relationships" do
  #   it "belongs_to patients" do
  #     is_expected.to belong_to(:patient)
  #   end
  # end
end
