# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item_name | string     | null: false                    |
| price     | string     | null: false                    |
| user_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card_number     | string     | null: false                    |
| expiration_date | string     | null: false                    |
| security_code   | string     | null: false                    |
| item_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## deliveries テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| zip_code   | string     | null: false                    |
| prefecture | string     | null: false                    |
| address    | string     | null: false                    |
| tel        | string     | null: false                    |
| buy_id     | references | null: false, foreign_key: true |

### Association

- has_one :delivery