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

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| first-name        | string | null: false |
| last-name         | string | null: false |
| first-name-kana   | string | null: false |
| last-name-kana    | string | null: false |
| birth-date        | string | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| item-name                  | text       | null: false                    |
| item-info                  | text       | null: false                    |
| item-category              | integer    | null: false                    |
| item-sales-status          | integer    | null: false                    |
| item-shipping-fee-status   | integer    | null: false                    |
| item-prefecture            | integer    | null: false                    |
| item-scheduled-delivery    | integer    | null: false                    |
| item-price                 | integer    | null: false                    |
| user                       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal-code    | string     | null: false                    |
| prefecture     | integer    | null: false                    |
| city           | string     | null: false                    |
| addresses      | string     | null: false                    |
| building       | string     |                                |
| phone-number   | string     | null: false                    |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item