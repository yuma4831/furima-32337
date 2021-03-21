# テーブル設計

## users テーブル

| Column                   | Type     | Options      |
| --------                 | ------   | -----------  |
| nickname                 | string   | null: false  |
| email                    | string   | unique: true, null: false |
| encrypted_password       | string   | null: false  |
| lastname                 | string   | null: false  |
| firstname                | string   | null: false  |
| lastname_kana            | string   | null: false  |
| firstname_kana           | string   | null: false  |
| birthday                 | date     | null: false  |

### Association

- has_many :items
- has_many :records

## items テーブル

| Column             | Type       | Options     |
| ------             | ------     | ----------- |
| name          | string     | null: false |
| price         | integer    | null: false |
| category_id        | integer    | null: false |
| condition_id       | integer    | null: false |
| shipping_fee_id    | integer    | null: false |
| shipping_area_id   | integer    | null: false |
| shipping_time_id   | integer    | null: false |
| user               | references | foreign_key: true |

- belongs_to :user
- has_one :record

## shippings テーブル

| Column           | Type          | Options     |
| -------          | ----------    | ------------|
| postal_code      | string       | null: false |
| shipping_area_id | references    | foreign_key: true |
| municipalities   | string        | null: false |
| adress           | string        | null: false |
| building_name    | string        |             |
| phone_number     | string        | null: false |
| user             | references    | foreign_key: true|
| item             | references    | foreign_key: true|

- belongs_to :record

## records テーブル

| Column           | Type          | Options     |
| -------          | ----------    | ------------|
| user             | references    |             |
| item             | references    |             |


- has_one :shipping
- belongs_to :user
- belongs_to :item