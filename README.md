# テーブル設計

## usersテーブル

|column          |Type   |options    |
|----------------|-------|-----------|
|nickname        |string |null: false|
|email           |string |null: false|
|password        |string |null: false|
|last_name_kanji |string |null: false|
|first_name_kanji|string |null: false|
|last_name_kana  |string |null: false|
|first_name_kana |string |null: false|
|date_of_birth   |date   |null: false|

### Association

- has_many :items
- has_many :comments
- has_many :users_items

## itemsテーブル

|column          |Type      |options          |
|----------------|----------|-----------------|
|user            |references|foreign_key: true|
|name            |string    |null: false      |
|describe        |text      |null: false      |
|category_id     |integer   |null: false      |
|item_status_id  |integer   |null: false      |
|shipping_cost_id|integer   |null: false      |
|shipping_area_id|integer   |null: false      |
|shipping_date_id|integer   |null: false      |
|price           |integer   |null: false      |

### Association

- belongs_to :user
- has_many   :comments
- has_one    :address
- has_many :users_items


## commentsテーブル

|column    |Type      |options          |
|----------|----------|-----------------|
|text      |text      |null: false      |
|user      |references|foreign_key: true|
|item      |references|foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item


## users_itemsテーブル

|column         |Type      |options|
|---------------|----------|-------|
|user_id        |references|through|
|item_id        |references|through|

### Association

- belongs_to :user
- belongs_to :item


## addressテーブル

|column         |Type      |options          |
|---------------|----------|-----------------|
|user           |references|                 |
|postal_code    |string    |null: false      |
|prefecture_id  |integer   |null: false      |
|municipalities |string    |null: false      |
|block_number   |string    |null: false      |
|building_name  |string    |                 |
|phone_number   |string    |null: false      |

### Association

- has_one  :item







