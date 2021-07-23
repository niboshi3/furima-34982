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
- has_many :oders



## itemsテーブル（商品情報）

| Column              | Type       | Options                          |
| ------------------- | ---------- | ---------------------------------|
| item_name           | string     | null: flase                      |
| appeal_point        | text       | null: flase                      |
| category_id         | integer    | null: flase                      |
| status_id           | integer    | null: flase                      |
| shipping_charge_id  | integer    | null: flase                      |
| prefecture_id       | integer    | null: flase                      |
| shipping_date_id    | integer    | null: flase                      |
| price               | integer    | null: flase                      |
| user                | references | null: false, foreign_key: true   |

### Association

- belongs_to :user
- has_one :oder




## orders テーブル（購入情報）

| Column              | Type       | Options                         |
| ------------------- | ---------- | --------------------------------|
| user               | references | null: false, foreign_key: true   |
| item               | references | null: false, foreign_key: true   |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address
- has_many :comments



## shipping_addressesテーブル（配送先情報）

| Column               | Type       | Options                          |
| -------------------- | ---------- | ---------------------------------|
| postal_code          | string     | null: flase                      |
| prefecture_id        | integer    | null: flase                      |
| municipality         | string     | null: flase                      |
| address              | string     | null: flase                      |
| building             | string     |                                  |
| telephone_number     | string     | null: flase                      |
| order                | references | null: false, foreign_key: true   |


### Association

- belongs_to :oder


 ~~## commentsテーブル（コメント※今回は必須実装ではない~~ 

~~| Column               | Type       | Options                          |
| -------------------- | ---------- | ---------------------------------|
| comment              | text       | null: flase                      |
| order             | references | foreign_key: true                |~~  


 ~~### Association~~ 

 ~~- belongs_to :oder~~ 
