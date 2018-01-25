class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :pretty_price, :invoice_id, :item_id

  def pretty_price
    (object.unit_price.to_f / 100).round(2)
  end

end
