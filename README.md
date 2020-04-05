# README

# REISE
![トップページ](https://gyazo.com/8fa71e305ea1846facdc579c20e632d0)
![一覧表示](https://gyazo.com/daf9f2f22ce106c6a31173b6adbec609)
![いいね](https://gyazo.com/2c4efa9c8690b659e1bdd1a2e55e49f1)

# 制作背景

コンセプト: 海外へ行く時の服装を簡単に見つけれる
国によって気候や温度などが違い、服装を選ぶのが難しい。そんな時に簡単に適切な服装を検索して探すことができることで、その国で着るべき服装がイメージしやすく、コーディネートの時短にもなる。いろんな人が旅先で着た写真を投稿することで、観光地での写真映えする服装などが分かり参考にできる。
私自身も海外旅行が好きで、旅先での服装はどんな物を着ればいいのか悩むことがあった。行き先は決まっていても、服装以外にも行きたい場所の詳細やスケジュールなどを決める必要がある為、できる限り服装を選ぶことに時間を費やしたくない。
行き先に着いても、こんな服装で写真を撮ればもっと良い写真になったかもしれないと思ったことがありました。
なので服装のイメージをしやすくし、旅先でもっとお洒落を楽しんでもらいたいと思いアプリを作成しました。

# 概要
- ユーザーログイン機能
- 画像投稿機能
- 非同期によるいいね機能
- 投稿写真を一覧表示

# 使い方
git clone https://github.com/taku1508/reise
cd reise
rails db:create  
rails db:migrate  
rails db:seed  
rails s  
  
デモ用アカウントのログイン情報  
email:   test1@test1.com
Password:  a111111
  
# アプリURL
URL : 本番環境デプロイ中

# DB設計

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|foreign_key: true|
|post_id|bigint|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :post, counter_cache: :likes_count


## postsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|body|string|null: false|
|image|string|null: false|
|user_id|integer||
|likes_count|integer||


### Association
- belongs_to :user
- has_many :comments
- has_many :likes, dependent: :destroy


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|nickname|string|null: false|


### Association
- has_many :images
- has_many :posts


## Note
データベースはMySQL、インフラはAWS、Nginx、Unicornを使用。  
<!-- AWSを使用してデプロイ済み   -->

検索機能、写真複数枚投稿機能、Google地図API機能を導入予定。

Author  
作成者: Takuya Kagase  
E-mail: tperry081515@gmail.com 