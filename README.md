# テーブル設計

## usersテーブル

|column            |Type   |options     |
|------------------|-------|------------|
|nickname          |string |null: false |
|email             |string |unique: true|
|encrypted_password|string |null: false |
|last_name_kanji   |string |null: false |
|first_name_kanji  |string |null: false |
|last_name_kana    |string |null: false |
|first_name_kana   |string |null: false |
|date_of_birth     |date   |null: false |

### Association

- has_many :items
- has_many :orders


## itemsテーブル

|column          |Type      |options          |
|----------------|----------|-----------------|
|user            |references|foreign_key: true|
|name            |string    |null: false      |
|describe        |text      |null: false      |
|category_id     |integer   |null: false      |
|item_status_id  |integer   |null: false      |
|shipping_cost_id|integer   |null: false      |
|prefecture_id   |integer   |null: false      |
|shipping_date_id|integer   |null: false      |
|price           |integer   |null: false      |

### Association

- belongs_to :user
- has_one    :order


## ordersテーブル

|column         |Type      |options          |
|---------------|----------|-----------------|
|user           |references|foreign_key: true|
|item           |references|foreign_key: true|


### Association

- belongs_to :user
- belongs_to :item
- has_one    :address


## addressesテーブル

|column         |Type      |options          |
|---------------|----------|-----------------|
|order          |references|foreign_key: true|
|postal_code    |string    |null: false      |
|prefecture_id  |integer   |null: false      |
|municipalities |string    |null: false      |
|block_number   |string    |null: false      |
|building_name  |string    |                 |
|phone_number   |string    |null: false      |

### Association

- belongs_to :order







