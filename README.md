# README

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| check_password     | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :orders
- has_many :items


## items テーブル

| Column           | Type    | Options                  |
| ---------------- | ------- | ------------------------ |
| name             | string  | null: false              |
| description      | text    | null: false              |
| category_id      | integer | null: false              |
| item_status_id   | integer | null: false              |
| shipping_cost_id | integer | null: false              |
| shipping_from_id | integer | null: false              |
| shipping_time_id | integer | null: false              |
| price            | integer | null: false              |

### Association
- has_many :orders
- belongs_to :user


## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| item_id          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column           | Type     | Options                  |
| ---------------- | -------- | ------------------------ |
| post_code        | integer  | null: false              |
| prefecture_id    | integer  | null: false              |
| city             | string   | null: false              |
| block_number     | string   | null: false              |
| building         | string   |                          |
| phone_number     | integer  | null: false              |

### Association
- belongs_to :order