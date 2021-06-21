# テーブル設計

## usersテーブル（ユーザー情報）

| Column               | Type     | Options                       |
| -------------------- | -------- | ------------------------------|
| nickname             | string   | null: flase                   |
| email                | string   | null: flase  , unique: true   |
| encrypted_password   | string   | null: flase                   |
| family_name          | string   | null: flase                   |
| first_name           | string   | null: flase                   |
| family_name_kana     | string   | null: flase                   |
| first_name_kana      | string   | null: flase                   |
| birthday             | date     | null: flase                   |


### Association

- has_many :items
- has_many :purchase_informations
- has_many :shipping_adresses
- has_many :comments


## itemsテーブル（商品情報）

| Column              | Type       | Options                          |
| ------------------- | ---------- | ---------------------------------|
| item_name           | string     | null: flase                      |
| appeal_point        | string     |                                  |
| category            | text       | null: flase                      |
| status              | text       | null: flase                      |
| shipping_charge     | text       | null: flase                      |
| shipping_area       | text       | null: flase                      |
| shipping_date       | text       | null: flase                      |
| price               | integer    | null: flase                      |
| user                | references | null: false, foreign_key: true   |

### Association

- belongs_to :user
- has_one :purchase_information
- has_many :shipping_addresses
- has_many :comments



# purchase_informationテーブル（購入情報）

| Column              | Type       | Options                         |
| ------------------- | ---------- | --------------------------------|
| user               | references | null: false, foreign_key: true   |
| item               | references | null: false, foreign_key: true   |

### Association

- belongs_to :user
- belongs_to :item



## shipping_addresses（配送先情報）

| Column             | Type       | Options                          |
| ------------------ | ---------- | ---------------------------------|
| postal_code        | integer    | null: flase                      |
| prefectures        | string     | null: flase                      |
| municipality       | string     | null: flase                      |
| address            | string     | null: flase                      |
| building           | string     |                                  |
| telephone_number   | string     | null: flase                      |
| user               | references | null: false, foreign_key: true   |
| item               | references | null: false, foreign_key: true   |

### Association

- belongs_to :user
- belongs_to :item


## commentsテーブル

| Column        | Type       | Options                          |
| ------------- | ---------- | ---------------------------------|
| comment       | text       | null: flase                      |
| user          | references | null: false, foreign_key: true   |
| item          | references | null: false, foreign_key: true   |

### Association

- belongs_to :user
- belongs_to :item
