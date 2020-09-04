# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column    | Type    | Options    |
| --------- | ------- | ---------- |
| nickname  | string  | null:false |
| email     | string  | null:false |
| password  | string  | null:false |
| parent_id | integer |            |

### Association
- has_many :items
- has_many :comments
- belongs_to_active_hash :parent


## items テーブル

| Column      | Type       | Options                     |
| ----------- | ---------- | --------------------------- |
| name        | string     | null:false                  |
| detail      | text       | null:false                  |
| category_id | integer    | null:false                  |
| tall_id     | integer    |                             |
| size        | integer    |                             |
| age         | integer    |                             |
| price       | integer    |                             |
| user        | references | null:false, foreign_key:true|


### Association
- belongs_to :user
- has_many :comments
- belongs_to_active_hash :category
- belongs_to_active_hash :tall


## commentsテーブル

| Column  | Type       | Options                     |
| ------- | ---------- | --------------------------- |
| comment | text       | null:false                  |
| user    | references | null:false, foreign_key:true|
| item    | references | null:false, foreign_key:true|


### Association
- belongs_to :user
- belongs_to :item