# RoomSharer

# アプリ紹介

### GIFで見る簡単な使い方

https://gyazo.com/8bb14d5a75a99d21d3b15ae0d330f161

https://gyazo.com/7c68d1715b0b0ad10b162c9d3979fda7

https://gyazo.com/f5a87a805ceafbcb42691c6bc7b7cbd9

## 実装機能

<dl>
  <dt>ユーザー登録 / ログイン / ログアウト</dt>
  <dd>コメントしたい、部屋を貸したい人向けです！</dd>
  <dt>投稿機能 / 編集 / 削除</dt>
  <dd>部屋を貸したい人向けです！</dd>
  <dt>投稿一覧 / 詳細</dt>
  <dd>部屋を借りたい人向けです！</dd>
  <dt>コメント機能</dt>
  <dd>上京予定だけど遠方にいたり、載っていない情報を質問したい人でも安心していただけます！</dd>
  <dt>検索機能</dt>
  <dd>物件の条件を絞って検索することができます！</dd>
</dl>

## 実際使ってみましょう！

### 環境<AWS>
http://54.248.208.82/

**テスト用アカウント**
<dl>
  <dt>Basic ID</dt>
  <dd>yusaku</dd>
  <dt>Basic Password</dt>
  <dd>miya0000</dd>
  <dt>アカウントメールアドレス</dt>
  <dd>sample1@sample.com</dd>
  <dt>アカウントパスワード</dt>
  <dd>sample1</dd>
</dl>

- ヘッダーに「新規登録」「ログイン」「部屋を貸す」ボタンがあります。
- 「部屋を貸す」機能はログインすると利用できます。ログインして実際に投稿してみましょう。
- 投稿するとトップページに戻り、トップページには先程投稿した部屋の情報が表示されています。
- 次にヘッダーの「自分の名前」ボタンをクリックすると、自分の投稿物のみが表示されるマイページへと飛びます。投稿物をクリックしてみましょう。
- 詳細画面に飛ぶと、トップページに表示されていない詳細情報や、投稿者のみ使える「編集/削除」機能があり、下にはコメントフォームがあります。
- 編集ボタンを押すと、投稿ページと同じようなページに飛ぶので、すでに登録された情報を書き換えることができます。
- 削除ボタンを押すと、投稿は消えてしまうのでお気をつけください
- 最後にログアウトし、投稿物の詳細画面に移動すると、「編集」「削除」「コメント」機能が使えなくなっていることがわかります
- 以上です。


# 解決したいこと

## ペルソナ
- 大学生、20代から30代中間、男女比= 6:4。
- 職業問わず アルバイター多め。
- アウトドアタイプが多い印象。
- 海外でシェアハウスを経験した。またはシェアハウスのテレビ番組から影響を受けた。舞台、声優、音楽などとバイトを掛け持ちして生活してるなど、夢を追っていたり、好きなことを日常に多く取り込んで生活してる方が利用すると予想。

## 課題
- 海外でシェアハウスを経験して日本でもやってみたいという方や、金銭的な不安がある方、テレビ番組の影響を受け興味を持った方の要望に応えたいです。
- 海外から日本にワーキングホリデーで来る方向けにも機能を実装していきたいと思っています。


## 要件定義

| 機能           | 目的                                             | 詳細                                                                         | ストーリー(ユースケース) |
| ------------- | ----------------------------------------------- | ---------------------------------------------------------------------------- | -------------------- |
| ユーザー管理    | 投稿、コメントはユーザー登録必須のため                 | ニックネーム、メールアドレス、性別、生年月日を入力して登録できます                      | ヘッダーに新規登録とログインボタンがあり、クリックするとそれぞれの入力画面に移動します |
| 投稿           | 投稿するため                                      | タイトル、説明文、都道府県、地区、金額、建物の形式、画像ら必須欄を埋め投稿                | ヘッダーに投稿ボタンがあるのでクリックすると投稿ページに移動します |
| 投稿一覧        | 投稿一覧を見るため                                 | トップページが一覧表示画面に設定されており、全投稿を確認できます                        | ヘッダーにあるアプリ名をクリックするとトップページに移動します。また、ルートパスはこのページです |
| 投稿詳細        | 詳細画面を見るため                                 | 詳細情報を表示します。編集、削除、コメントの機能もこのページにあります                   | 投稿物をクリックすると詳細画面に移動することができます |
| 投稿編集        | 情報を修正できるようにするため                       | 投稿物の情報を修正することができます                                               | 投稿主のみ詳細画面から編集ボタンを押し編集ページへ移動できます |
| コメント        | 投稿者とそれ以外の利用者の意思疎通ができる場が必要なため | 投稿者とコミュニケーションを取ることができ、質問や内見の日程などの用件を伝えるのが主な使い方 | 詳細画面の下の方にコメントフォームがあり、ログインしてる状態でコメントを入力し送信ボタンを押します |
| 投稿削除        | 投稿を削除するため                                 | 詳細画面から利用可能、投稿者のみ削除ボタンを表示されています                            | 投稿主のみ詳細画面から削除ボタンを押し削除できます |
| 検索機能        | 条件を絞り込んで投稿を探しやすくするため               | 都道府県ごとに表示したり、キーワードを検索フォームに打ち込み、条件を絞って物件を探せます    | トップページからキーワード、金額、都道府県らのどれかを入力し検索ボタンを押すと、ページが飛んで条件にあった物件が出てきます |
| マイページ      | 自分の投稿、投稿についたコメントを確認するため          | マイページには自分の投稿のみが表示されます                                           | ヘッダーの自分の名前からマイページに移動できます |






# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| gender           | integer| null: false |
| birthday         | date   | null: false |

### Association

- has_many :posts
- has_many :comments


## posts テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| explain       | text       | null: false                    |
| prefecture_id | integer    | null: false                    |
| local         | text       | null: false                    |
| price         | integer    | null: false                    |
| building      | string     | null: false                    |
| other         | string     |                                |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments, dependent: :destroy
- has_one_attached :image
- belongs_to :prefecture


## comments テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| text          | text       | null: false                    |
| user          | references | null: false, foreign_key: true |
| post          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post


## prefectures テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |

### Association

- has_many :posts


# 実装予定の機能
- チャットルーム作成 & 非同期でのチャット機能
- 登録カラムの追加
- 複数画像投稿機能