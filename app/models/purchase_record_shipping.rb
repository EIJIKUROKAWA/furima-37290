class PurchaseRecordShipping
  include ActiveModel::Model
  attr_accessor :shipping_number, :area_id, :shipping_city, :shipping_address, :shipping_building, :telephone_number, :item_id,
                :user_id, :token

  with_options presence: true do
    validates :shipping_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shipping_city
    validates :shipping_address
    validates :telephone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    validates :area_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)

    Shipping.create(shipping_number: shipping_number, area_id: area_id, shipping_address: shipping_address,
                    shipping_city: shipping_city, shipping_building: shipping_building, telephone_number: telephone_number, purchase_record_id: purchase_record.id)
  end
end
