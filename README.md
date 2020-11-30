# README

![64938F3F-BE18-4A32-A0CE-E015005BD07E_1_105_c](https://user-images.githubusercontent.com/67090591/100562018-bd5c7580-32fd-11eb-8ff4-0143c1546583.jpeg)

このアプリを作った理由
・好きな画像にタイトルをつけて投稿を共感してもらえる人とコミニュケーションをとれるように出来るアプリ。

・アプリ名 Freedom Pots
・url https://tranquil-shelf-81798.herokuapp.com/
画面上部のゲストボタンから、メールアドレスとパスワードを入力せずにログインできます。

・Ruby 2.6.5
・Ruby on Rails 6.0.0
・MySQL 5.3
・Heroku

機能一覧
・ユーザー登録、ログイン機能(devise)
・投稿機能
・画像投稿
・編集機能
・いいね機能
・お気に入り機能
・コメント機能（ajax）
・検索機能(ajax)

工夫したポイント
・お気に入り登録するとマイページのお気に入りに表示出来ること。

今後の課題
・今回はいいね機能やお気に入り機能を非同期通信を行おうとチャレンジを行ったのですが、上手く行かなくて今回は、非同期通信ではないので、非同期通信に出来るようにサーバー側の勉強をして出来るようにしたいです。

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|name|string|null: false|
### Association
- has_many ::tweets
- has_many :commants
- has_many :favorites
- has_many :likes

## tweetテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|
|text|string|
|image|text|
|user_id|integer|
### Association
- belongs_to :user
- has_many :comments
- has_many :favorites
- has_many :likes

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|image|txet||
|user_id|references|null: fales, foreign_key: true|
|group_id|references|null: false, foreign_key: true|
### Association
- belongs_to :tweet
- belongs_to :user

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|uesr|references|null: false|null: fales, foreign_key: true|
|tweet|references|null: false|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :tweet

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|uesr|references|null: false|null: fales, foreign_key: true|
|tweet|references|null: false|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :tweet
