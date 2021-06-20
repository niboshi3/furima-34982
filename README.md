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

### Association

- has_one :cards
- has_many :items
- has_many :comments
- has_many :shipping_adresses


## cardsテーブル

| Column             | Type       | Options                          |
| ------------------ | ---------- | ---------------------------------|
| card               | integer    | null: flase                      |
| time_limit         | integer    | null: flase                      |
| security           | integer    | null: flase                      |
| user_id            | references | null: false, foreign_key: true   |

### Association

- belongs_to :user


## itemsテーブル

| Column              | Type       | Options                          |
| ------------------- | ---------- | ---------------------------------|
| image               | string     | ActiveStorage                    |
| item_nam            | string     | null: flase                      |
| appeal_point        | string     |                                  |
| category            | text       | null: flase                      |
| status              | text       | null: flase                      |
| shipping_charge     | text       | null: flase                      |
| shipping_area       | text       | null: flase                      |
| shipping_date       | text       | null: flase                      |
| price               | integer    | null: flase                      |
| user_id             | references | null: false, foreign_key: true   |

### Association

- belongs_to :user
- has_many :comments
- has_many :shipping addresses


## shipping addresses

| Column             | Type       | Options                          |
| ------------------ | ---------- | ---------------------------------|
| postal_code        | integer    | null: flase                      |
| prefectures        | text       | null: flase                      |
| municipality       | text       | null: flase                      |
| address            | text       | null: flase                      |
| building           | text       | null: flase                      |
| telephone_number   | integer    | null: flase                      |
| user_id            | references | null: false, foreign_key: true   |
| item_id            | references | null: false, foreign_key: true   |

### Association

- belongs_to :user
- belongs_to :item


## commentsテーブル

| Column        | Type       | Options                          |
| ------------- | ---------- | ---------------------------------|
| comment       | text       | null: flase                      |
| user_id       | references | null: false, foreign_key: true   |
| item_id       | references | null: false, foreign_key: true   |

### Association

- belongs_to :user
- belongs_to :item
