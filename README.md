# テーブル設計

## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------ -| ------------------------ |
| name               | string  | null: false              |
| email              | string  | null: false,unique: true |
| encrypted_password | string  | null: false              |
| age                | integer |                          |
| gender             | string  |                          |
| trouble            | text    | null: false              |
| occupation         | string  | null: false              |
| phone              | integer | null: false              |

### Association

- belongs_to :appoint


## staffs テーブル

| Column    | Type    | Options                  |
| --------- | --------| ------------------------ |
| name      | string  | null: false              |
| gender    | string  | null: false              |
| age       | integer | null: false              |
| advantage | text    | null: false              |
| position  | string  | null: false              |
| appeal    | text    | null: false              |

### Association

- has_many :appoints
- has_one  :calendar


## appoints テーブル

| Column | Type       | Options                        |
| ------ | -----------| ------------------------------ |
| user   | references | null: false, foreign_key: true |
| staff  | references | null: false, foreign_key: true |
| time   | integer    | null: false                    |

### Association

- has_one    :user
- belongs_to :staff


## calenders テーブル

| Column  | Type       | Options                        |
| ------- | -----------| ------------------------------ |
| date    | date       | null: false                    |
| appoint | references | null: false, foreign_key: true |

### Association

- has_one  :staff
- has_many :appoints