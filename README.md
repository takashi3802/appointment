# テーブル設計

## users テーブル

| Column             | Type    | Options                  |
| ------------------ | --------| ------------------------ |
| name               | string  | null: false              |
| email              | string  | null: false,unique: true |
| encrypted_password | string  | null: false              |
| age                | integer | null: false              |
| gender_id          | integer | null: false              |
| trouble            | text    |                          |
| occupation         | string  |                          |
| phone              | string  | null: false              |

### Association

- has_many :appoints
- has_many :messages
- has_many :sns_credentials


## staffs テーブル

| Column    | Type      | Options                        |
| --------- | ----------| ------------------------------ |
| name      | string    | null: false                    |
| gender_id | integer   | null: false                    |
| age       | integer   | null: false                    |
| advantage | text      | null: false                    |
| position  | string    | null: false                    |
| appeal    | text      | null: false                    |
| user      | reference | null: false, foreign_key: true |

### Association

- has_many :appoint
- has_many :messages


## appoints テーブル

| Column         | Type       | Options                        |
| -------------- | -----------| ------------------------------ |
| user           | references | null: false, foreign_key: true |
| staff          | references | null: false, foreign_key: true |
| start_time     | datetime   | null: false                    |
| time_select_id | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to :staff


## messages テーブル

| Column | Type       | Options                        |
| ------ | -----------| ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| staff  | references | null: false, foreign_key: true |

### Association

- belongs_to  :staff
- belongs_to  :user


## sns_credentials テーブル

| Column   | Type       | Options           |
| -------- | -----------| ----------------- |
| provider | string     |                   |
| uid      | string     |                   |
| user     | references | foreign_key: true |

### Association

- belongs_to  :user