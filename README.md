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
| category_id   | integer    | null: false                    |
| status_id     | integer    | null: false                    |
| burden_id     | integer    | null: false                    |
| area_id       | integer    | null: false                    |
| days_id       | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

belongs_to :user
has_one :order

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

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| area_id       | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

belongs_to :order
