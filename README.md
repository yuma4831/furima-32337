# テーブル設計

## users テーブル

| Column                   | Type     | Options      |
| --------                 | ------   | -----------  |
| nickname                 | string   | null: false  |
| email                    | string   | unique: true |
| encrypted_password       | string   | null: false  |
| lastname                 | string   | null: false  |
| firstname                | string   | null: false  |
| lastname_kana            | string   | null: false  |
| firstname_kana           | string   | null: false  |
| birthday                 | date     | null: false  |

### Association

- has_many :item
- has_many :shipping
- has_one :record

## items テーブル

| Column             | Type       | Options     |
| ------             | ------     | ----------- |
| item_name          | string     | null: false |
| item_price         | integer    | null: false |
| image              |            | ActiveStorageを用いて実装 |
| category_id        | integer    | null: false |
| condition_id       | integer    | null: false |
| shipping_fee_id    | integer    | null: false |
| shipping_area_id   | integer    | null: false |
| shipping_time_id   | integer    | null: false |
| user               | references |             |

- belongs_to :user
- has_many :shipping
- has_one :record

## shippings テーブル

| Column           | Type          | Options     |
| -------          | ----------    | ------------|
| postal_code      | string       | null: false |
| prefectures_id   | integer       | null: false |
| municipalities   | string        | null: false |
| adress           | string        | null: false |
| building_name    | string        |             |
| phone_number     | string        | null: false |
| user             | references    |             |
| item             | references    |             |

- belongs_to :user
- belongs_to :item

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

- belongs_to :user
- belongs_to :item