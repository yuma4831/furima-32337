# テーブル設計

## users テーブル

| Column                   | Type     | Options     |
| --------                 | ------   | ----------- |
| nickname                 | string   | null: false |
| email                    | string   | null: false |
| password                 | string   | null: false |
| password_confirmation    | string   | null: false |
| lastname                 | string   | null: false |
| firstname                | string   | null: false |
| lastname_kana            | string   | null: false |
| firstname_kana           | string   | null: false |
| birthday_year            | date     | null: false |
| birthday_month           | date     | null: false |
| birthday_day             | date     | null: false |

## items テーブル

| Column          | Type       | Options     |
| ------          | ------     | ----------- |
| item_name       | string     | null: false |
| item_price      | integer    | null: false |
| image           |            |             |
| category        | string     | null: false |
| condition       | string     | null: false |
| shipping_fee    | string     | null: false |
| shipping_area   | string     | null: false |
| shipping_time   | string     | null: false |
| user            | references |             |

## records テーブル

| Column           | Type          | Options     |
| -------          | ----------    | ------------|
| postal_code      | integer       | null: false |
| prefectures      | string        | null: false |
| municipalities   | string        | null: false |
| adress           | string        | null: false |
| building_name    | string        | null: false |
| phone_number     | integer       | null: false |
| user             | references    |             |
| item             | references    |             |