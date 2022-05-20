テーブル設計

## usersテーブル

| Column                 | Type   | Options                   |
| ---------------------- | ------ | ------------------------- |
| email                  | string | null: false, unique: true |
| encrypted_password     | string | null: false               |
| nickname               | string | null: false               |
| last_name              | string | null: false               |
| first_name             | string | null: false               |
| last_name_kana         | string | null: false               |
| first_name_kana        | string | null: false               |
| birthday               | date   | null: false               |

## Association

has_many :products
has_many :purchaseorders

## productsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| price              | integer    | null: false                    |
| detail             | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| shipping_cost_id   | integer    | null: false                    |
| prefecure_id       | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
## Association

belongs_to :user
has_one :purchaseorder

## purchase_ordersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| product            | references | null: false, foreign_key: true |

## Association

belongs_to :user
belongs_to :product
has_one :destination

## destinationsテーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecrure_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| blockname        | string     | null: false                    |
| building         | string     |                                |
| phone_number     | string     | null: false                    |
| purchase_order   | references | null: false, foreign_key: true |

## Association

belongs_to: :purchaseorder