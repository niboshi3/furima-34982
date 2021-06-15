# テーブル設計

## usersテーブル

| Column           | Type     | Options        |
| ---------------- | -------- | ---------------|
| nickname         | string   | null: flase    |
| email            | string   | null: flase    |
| password         | string   | null: flase    |
| family_name      | string   | null: flase    |
| first_name       | string   | null: flase    |
| family_name_kana | string   | null: flase    |
| first_name_kana  | string   | null: flase    |
| birthday_year    | integer  | null: flase    |
| birthday_month   | integer  | null: flase    |
| birthday_day     | integer  | null: flase    |
| introduction     | string   |                |
| user_image       | string   | ActiveStorage  |

### Association

- has_many :products
- has_many :comments
- has_many :trades
- belongs_to :shipping_adress
- belongs_to :card


## cardsテーブル

| Column             | Type       | Options                          |
| ------------------ | ---------- | ---------------------------------|
| card               | integer    | null: flase                      |
| time_limit         | integer    | null: flase                      |
| security           | integer    | null: flase                      |
| user               | references | null: false, foreign_key: true   |

### Association

- belongs_to :user


## shipping address

| Column             | Type       | Options                          |
| ------------------ | ---------- | ---------------------------------|
| postal_code        | integer    | null: flase                      |
| Prefectures        | text       | null: flase                      |
| municipality       | text       | null: flase                      |
| address            | text       | null: flase                      |
| building           | text       | null: flase                      |
| telephone_number   | integer    | null: flase                      |
| user               | references | null: false, foreign_key: true   |
| product            | references | null: false, foreign_key: true   |

### Association

- belongs_to :user


## productsテーブル

| Column              | Type       | Options                          |
| ------------------- | ---------- | ---------------------------------|
| title               | string     | null: flase                      |
| image               | string     | ActiveStorage                    |
| appeal_point        | string     |                                  |
| price               | integer    | null: flase                      |
| category            | text       | null: flase                      |
| status              | text       | null: flase                      |
| shipping_charge     | text       | null: flase                      |
| shipping_area       | text       | null: flase                      |
| shipping_date       | text       | null: flase                      |
| user                | references | null: false, foreign_key: true   |

### Association

- belongs_to :user


## commentsテーブル

| Column        | Type       | Options                          |
| ------------- | ---------- | ---------------------------------|
| text          | text       | null: flase                      |
| user          | references | null: false, foreign_key: true   |
| product       | references | null: false, foreign_key: true   |

### Association

- belongs_to :user
- belongs_to :product
