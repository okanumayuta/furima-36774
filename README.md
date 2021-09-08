# README

## users テーブル

| Column              | Type                        | Options                  |
|---------------------|-----------------------------|--------------------------|
| nickname            | string                      | null: false              |
| email               | string                      | null: false, unique: true|
| encrypted_password  | string                      | null: false              |
| first_name          | string                      | null: false              |
| last_name           | string                      | null: false              |
| first_name_kana     | string                      | null: false              |
| last_name_kana      | string                      | null: false              |
| birth_date          | date                        | null: false              |

# Association
- has_many :items
- has_many :purchase_records


## items テーブル

| Column                | Type                        | Options                        |
|-----------------------|-----------------------------|--------------------------------|
| name                  | string                      | null: false                    |
| image                 | ActiveStorage               | null: false                    |
| price                 | integer                     | null: false                    |
| user                  | reference                   | null: false, foreign_key: true |
| info                  | text                        | null: false                    |
| category_id           | integer                     | null: false                    |
| sales_status_id       | integer                     | null: false                    |
| shipping_fee_status_id| integer                     | null: false                    |
| prefecture_id         | integer                     | null: false                    |
| scheduled_delivery_id | integer                     | null: false                    |

# Association
- belongs_to :user
- has_one :purchase_record


## purchase_records テーブル

| Column              | Type                        | Options                        |
|---------------------|-----------------------------|--------------------------------|
| user                | reference                   | null: false, foreign_key: true |
| item                | reference                   | null: false, foreign_key: true |

# Association
- belongs_to :user
- belongs_to :item
- has_one :delivery_address


## pay_forms テーブル

| Column              | Type                        | Options                        |
|---------------------|-----------------------------|--------------------------------|
| purchase_record     | reference                   | null: false, foreign_key: true |
| postal_code         | integer                     | null: false, foreign_key: true |
| prefecture_id       | integer                     | null: false, foreign_key: true |
| city                | string                      | null: false, foreign_key: true |
| addresses           | string                      | null: false, foreign_key: true |
| building            | string                      |                                |
| phone_number        | integer                     | null: false, foreign_key: true |

# Association
- belongs_to :purchase_record