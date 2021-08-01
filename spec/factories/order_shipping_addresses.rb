FactoryBot.define do
  factory :order_shipping_address do
    postal_code {"123-4567"}
    prefecture_id { 2 }
    municipality { "旭川市" }
    address { "東旭川町倉沼1-1-1" }
    building {"ABCビル"}
    telephone_number {"0166361104"}
    token{"user123"}
  end
end
