FactoryBot.define do
  factory :item do
    item_name {"ぬいぐるみ"}
    appeal_point {"手作り"}
    category_id {"2"}
    status_id {"2"}
    shipping_charge_id {"2"}
    prefecture_id {"2"}
    shipping_date_id {"2"}
    price {"20000"}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
