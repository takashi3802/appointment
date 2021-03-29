# アプリ名
 予約受付アプリ

# 概要
  アカウント作成後、スタッフを選択して日付けと時間を選んで予約ボタンを押すと、カレンダーに予約内容が表示されるアプリを作成しました。

# 本番環境
 https://appointment-34451.herokuapp.com/

 ## BASIC認証
 ・ID:takashi
 ・PASS:6424

 ## ログイン情報(テスト用)
  スタッフ管理者ユーザー
  ・名前:admin
  ・Email:admin@com
  ・pass:admin1111
 ## ユーザー
  ・名前:takashi
  ・Email:takashi@com
  ・pass:ta6424

# 制作背景
 前職のドラッグストアで勤務していた時、セール中など忙しい日は急な来客にしっかり応対することが難しいと感じていました。
 そこで、事前に来店する日にち時間がわかっていれば、時間を作り質の高い接客が可能になるのではと思い作成しました。

# 苦労したポイント
 予約した内容を、カレンダーの日付けごとに表示させることに苦労しました。

# 課題
  現状、同じスタッフ、同じ日付け、同じ時間にもう一度予約すると、同じ内容が二重で表示されるので制限する必要があると思います。

# 使用技術(開発環境)
 ## バックエンド
 Ruby, Ruby on Rails

 ## フロントエンド
 Html, Css, JavaScript

 ## データベース
 MySQL

 ## 本番環境
 Heroku

 ## ソース管理
 GitHub, GitHubDesktop

 ## テスト
 RSpec

 ## エディタ
 Visual Studio Code

# DB設計

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