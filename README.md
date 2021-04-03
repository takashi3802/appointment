# アプリ名
 予約受付アプリ

# 制作背景
 前職のドラッグストアで勤務していた時、セール中など忙しい日は急な来客にしっかり応対することが難しいと感じていました。
 そこで、事前に来店する日にち時間がわかっていれば、そこで時間を作り質の高い接客が可能になるのではと思い作成しました。

# 概要
  * アカウント作成後、スタッフを選択して日付けと時間を選んで予約ボタンを押すと、カレンダーに予約内容が表示されるアプリを作成しました。
  * テストユーザーでログイン後、スタッフの画像をクリック→このスタッフを予約するボタンをクリック→日付けと時間を選択して予約するボタンをクリックすると,TOPページのカレンダーに予約内容が表示されます。

# DEMO
 ## トップページ
 * 予約一覧とスタッフ一覧が表示されます。
 * スタッフの画像をクリックするとスタッフ詳細ページへ背遠いします。
 * 「マイページへ」ボタンをクリックするとユーザー詳細ページへ遷移します。
 <img width="1157" alt="スクリーンショット 2021-04-02 18 39 17" src="https://user-images.githubusercontent.com/78143012/113404776-ad57be00-93e3-11eb-9844-411bd0ba1157.png">

 ## スタッフ詳細ページ
 * スタッフに対してメッセージを送ることができます。
 * 「このスタッフを予約する」ボタンをクリックすると予約ページへ遷移します。
 <img width="1145" alt="スクリーンショット 2021-04-02 19 00 10" src="https://user-images.githubusercontent.com/78143012/113406053-c9f4f580-93e5-11eb-8a3a-20f08c0d3443.png">

 ## 予約ページ
 * 日付けと時間を選択して「予約する」ボタンをクリックすると予約内容を反映してTOPページへ遷移します。
 <img width="1154" alt="スクリーンショット 2021-04-02 19 07 57" src="https://user-images.githubusercontent.com/78143012/113406649-cdd54780-93e6-11eb-9469-2c78639fc037.png">

 ## ユーザー詳細ページ
 * ユーザー情報の編集と削除が可能です。
 * ログインユーザーの予約のみカレンダーに表示されます。
 <img width="1141" alt="スクリーンショット 2021-04-02 19 11 36" src="https://user-images.githubusercontent.com/78143012/113406922-46d49f00-93e7-11eb-8998-24ac86ce8dae.png">

# 本番環境
 https://appointment-34451.herokuapp.com/

 ## BASIC認証
 * ID:takashi
 * PASS:6424

 ## ログイン情報(テスト用)
  ### スタッフ管理者ユーザー
   * Email:admin@com
   * pass:admin1111
  ### テストユーザー
   * Email:takashi@com
   * pass:ta6424

# 工夫したポイント
 * いつ誰が予約しているか分かりやすように、カレンダーに一覧表示しています。
 * スタッフを選ぶ基準として、そのスタッフがどの悩みを解決してくれそうか、スタッフのプロフィールに表示しているので、自分の悩みと照らし合わせて選ぶことができます。

# 苦労したポイント
 予約した内容を、カレンダーの日付けごとに表示させることに苦労しました。

# 課題
  現状、同じスタッフ、同じ日付け、同じ時間にもう一度予約すると、同じ内容が二重で表示されるので制限する必要があると思います。
  例)ユーザー1がスタッフ1に対して4月1日の10：00に予約をした後、ユーザー2もスタッフ1に対して4月1日の10：00に予約できてしまう。

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