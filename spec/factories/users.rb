FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = '1a' + Faker::Internet.password(min_length: 6) 
    password {password}
    password_confirmation {password}
    family_name {"山田"}
    family_name_kana {"ヤマダ"}
    first_name {"太郎"}
    first_name_kana {"タロウ"}
    birthday {Faker::Date.birthday}
  end
end