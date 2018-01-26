class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :unit_price, :merchant_id

  # has_many :invoice_items
  # belongs_to :merchant

  def unit_price
    (object.unit_price.to_f / 100).to_s
  end

  def merchant_id
    object.merchant.id
  end

end
