# テーブル設計

## usersテーブル

| Column              | Type    | Option      |
| ------------------- | ------- | ----------- |
| email               | string  | null: false |
| password            | string  | null: false |
| nickname            | string  | null: false |
| name_first          | string  | null: false |
| name_last           | string  | null: false |
| name_reading_first  | string  | null: false |
| name_reading_last   | string  | null: false |
| birthday            | date    | null: false |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column        | Type       | Option                         |
| --------------| ---------- | ------------------------------ |
| name          | string     | null: false                    |
| description   | text       | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

belongs_to :user
has_one :item_profiles
has_one :delivery
has_one :order

## item_profilesテーブル

| Column        | Type       | Option                         |
| --------------| ---------- | ------------------------------ |
| category      | integer    | null: false                    |
| status        | integer    | null: false                    |
| item          | references | null: false, foreign_key: true |

### Association

belongs_to :item

## deliveriesテーブル

| Column    | Type       | Option                         |
| --------- | ---------- | ------------------------------ |
| burden    | integer    | null: false                    |
| area      | integer    | null: false                    |
| days      | integer    | null: false                    |
| item      | references | null: false, foreign_key: true |

### Association

belongs_to :item

## ordersテーブル

| Column    | Type       | Option                         |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one :address

## addressesテーブル

| Column       | Type       | Option                         |
| ------------ | ---------- | ------------------------------ |
|postal_code   | string     | null: false                    |
|prefecture    | integer    | null: false                    |
|city          | string     | null: false                    |
|house_number  | string     | null: false                    |
|building_name | string     |                                |
|phone_number  | integer    | null: false                    |
| order        | references | null: false, foreign_key: true |

### Association

belongs_to :order
