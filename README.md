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
- 

## itemsテーブル

|column       |Type      |options    |
|-------------|----------|-----------|
|user         |references|           |
|image        |          |           |
|item_name    |string    |null: false|
|item_describe|text      |null: false|
|category     |integer   |null: false|
|item_status  |integer   |null: false|
|shipping_cost|integer   |null: false|
|shipping_area|integer   |null: false|
|shipping_date|integer   |null: false|
|price        |integer   |null: false|
|fee          |integer   |null: false|
|profit       |integer   |null: false|

### Association

- belongs_to :user
- has_many   :comments
- has_one    :card
- has_one    :address


## commentsテーブル

|column    |Type      |options    |
|----------|----------|-----------|
|text      |text      |null: false|
|user      |references|           |
|item      |references|           |

### Association

- belongs_to :user
- belongs_to :item


## cardsテーブル

|column         |Type      |options    |
|---------------|----------|-----------|
|user           |references|           |
|card_number    |integer   |null: false|
|expiration_date|integer   |null: false|
|security_code  |integer   |null: false|

### Association

- has_one  :item
- has_one  :address


## addressテーブル

|column         |Type      |options    |
|---------------|----------|-----------|
|user           |references|
|postal_code    |integer   |null: false|
|prefecture     |string    |null: false|
|municipalities |string    |null: false|
|block_number   |string    |null: false|
|building_name  |string    |null: false|
|phone_number   |integer   |null: false|

### Association

- has_one  :item
- has_one  :card






