# テーブル設計

## users テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| nickname    | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| family_name | string | null: false |
| first_name  | string | null: false |
| myoji       | string | null: false |
| namae       | string | null: false |
| birthday    | string | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| detail       | string     | null: false                    |
| category     | string     | null: false                    |
| condition    | string     | null: false                    |
| delivery_fee | string     | null: false                    |
| prefecture   | string     | null: false                    |
| day          | string     | null: false                    |
| price        | string     | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery

## deliveries テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| zip_code   | string     | null: false                    |
| prefecture | string     | null: false                    |
| city       | string     | null: false                    |
| address    | string     | null: false                    |
| building   | string     | null: false                    |
| tel        | string     | null: false                    |
| buy        | references | null: false, foreign_key: true |

### Association

- belongs_to :buy