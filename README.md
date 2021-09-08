# README

## users テーブル

| Column              | Type                        | Options                |
|---------------------|-----------------------------|------------------------|
| name                | string                      | null: false            |
| email               | string                      | null: false            |
| encrypted_password  | string                      | null: false            |

# Association
- has_many :items


## items テーブル

| Column              | Type                        | Options                        |
|---------------------|-----------------------------|--------------------------------|
| product_name        | string                      | null: false                    |
| price               | numeric                     | null: false                    |
| user                | reference                   | null: false, foreign_key: true |

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


## delivery_addresses テーブル

| Column              | Type                        | Options                        |
|---------------------|-----------------------------|--------------------------------|
| purchase_record     | reference                   | null: false, foreign_key: true |
| address             | string                      | null: false, foreign_key: true |

# Association
- belongs_to :purchase_record