# テーブル設計

## users テーブル

| Column      | Type   | Options                  |
| ----------- | ------ | ------------------------ |
| nickname    | string | null: false, unique:true |
| email       | string | null: false, unique:true |
| password    | string | null: false              |
| family_name | string | null: false              |
| first_name  | string | null: false              |
| myoji_kana  | string | null: false              |
| namae_kana  | string | null: false              |
| birthday    | date   | null: false              |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| detail          | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| day_id          | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

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
| prefecture | integer    | null: false                    |
| city       | string     | null: false                    |
| address    | text       | null: false                    |
| building   | string     |                                |
| tel        | string     | null: false                    |
| buy        | references | null: false, foreign_key: true |

### Association

- belongs_to :buy