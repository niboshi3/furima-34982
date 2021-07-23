class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor  :price, :postal_code, :prefecture_id, :municipality, :address, :building, :telephone_number , :user_id, :item_id
  
  with_options presence: true do
    validates :price
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :municipality
    validates :address
    validates :telephone_number,format:{with: /\A\d{10,11}\z/}
    validates :user_id
    validates :item_id
  end

  def save
    # 情報を保存し、変数orderに代入する
    order = Order.create(price: price,user_id: user_id,item_id: item_id)
    # 住所を保存する
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, telephone_number: telephone_number,order_id: order.id)
  end
end