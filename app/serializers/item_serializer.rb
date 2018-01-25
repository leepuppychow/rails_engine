class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :pretty_price

  def pretty_price
    (object.unit_price.to_f / 100)
  end

end
