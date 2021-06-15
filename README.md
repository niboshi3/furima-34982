# テーブル設計

## usersテーブル

| Column      | Type     | Options        |
| ----------- | -------- | ---------------|
| nickname    | string   | null: flase    |
| email       | string   | null: flase    |
| password    | string   | null: flase    |
| name        | string   | null: flase    |
| birthday    | integer  | null: flase    |


### Association

- has_many :products
- has_many :comments
- has_many :trades

## productsテーブル

| Column              | Type       | Options                          |
| ------------------- | ---------- | ---------------------------------|
| title               | string     | null: flase                      |
| image               | string|    | ActiveStorage                    |
| price               | integer    | null: flase                      |
| username            | references | null: false, foreign_key: true   |
| category            | text       | null: flase                      |
| status              | text       | null: flase                      |
| delivery_charge     | text       | null: flase                      |
| area                | text       | null: flase                      |
| delivery_date       | text       | null: flase                      |

### Association

- belongs_to :trade
- belongs_to :user
- belongs_to :comment

## tradesテーブル

| Column             | Type       | Options                          |
| ------------------ | ---------- | ---------------------------------|
| card               | integer    | null: flase                      |
| time_limit         | integer    | null: flase                      |
| security           | integer    | null: flase                      |
| postal_code        | integer    | null: flase                      |
| Prefectures        | text       | null: flase                      |
| municipality       | text       | null: flase                      |
| address            | text       | null: flase                      |
| building           | text       | null: flase                      |
| telephone_number   | integer       | null: flase                      |
| user               | references | null: false, foreign_key: true   |
| product            | references | null: false, foreign_key: true   |

### Association

- belongs_to :user
- belongs_to :prototype

## commentsテーブル

| Column        | Type       | Options                          |
| ------------- | ---------- | ---------------------------------|
| text          | text       | null: flase                      |
| user          | references | null: false, foreign_key: true   |
| product       | references | null: false, foreign_key: true   |

### Association

- belongs_to :user
- belongs_to :product
