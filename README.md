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

has_many: :products
has_many: :purchaseorders
has_one: :card

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

belongs_to: :user
has_one: :purchaseorder

## purchaseordersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| product            | references | null: false, foreign_key: true |

## Association

belongs_to: :user
belongs_to: :product
has_one: :destination

## destinationsテーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| postalcode       | integer    | null: false                    |
| prefecrure_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| blockname        | integer    | null: false                    |
| building         | string     |                                |
| phonenumber      | integer    | null: false                    |
| purchaseorder    | references | null: false, foreign_key: true |

## Association

belongs_to: :purchaseorder

## purchaseordersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| customer_token     | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

## Association

belongs_to: :user