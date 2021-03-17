# テーブル設計

## users テーブル

| Column                   | Type     | Options      |
| --------                 | ------   | -----------  |
| nickname                 | string   | null: false  |
| email                    | string   | unique: true |
| password                 | string   | null: false  |
| encrypted_password       | string   | null: false  |
| lastname                 | string   | null: false  |
| firstname                | string   | null: false  |
| lastname_kana            | string   | null: false  |
| firstname_kana           | string   | null: false  |
| birthday                 | date     | null: false  |


## items テーブル

| Column             | Type       | Options     |
| ------             | ------     | ----------- |
| item_name          | string     | null: false |
| item_price         | integer    | null: false |
| image              |            |             |
| category_id        | integer    | null: false |
| condition_id       | integer    | null: false |
| shipping_fee_id    | integer    | null: false |
| shipping_area_id   | integer    | null: false |
| shipping_time_id   | integer    | null: false |
| user               | references |             |

## shippings テーブル

| Column           | Type          | Options     |
| -------          | ----------    | ------------|
| postal_code      | integer       | null: false |
| prefectures_id   | integer       | null: false |
| municipalities   | string        | null: false |
| adress           | string        | null: false |
| building_name    | string        |             |
| phone_number     | integer       | null: false |
| user             | references    |             |
| item             | references    |             |

## records テーブル

| Column           | Type          | Options     |
| -------          | ----------    | ------------|
| lastname         | references    |             |
| firstname        | references    |             |
| lastname_kana    | references    |             |
| firstname_kana   | references    |             |
| birthday         | references    |             |
| user             | references    |             |
| item             | references    |             |