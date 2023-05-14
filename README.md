# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| occupation         | text   | null: false               |
| position           | text   | null: false               |

### Association

- has_many :groups
- has_many :posts
- has_many :comments
- has_many :owned_groups, class_name: "Group"

## groups テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| introduction | text       |                                |
| user         | references | null: false, foreign_key: true |

### Association

- has_many :users
- has_many :posts
- belongs_to :user

## group_usersテーブル

| Colum | Type       | Options           |
| ----- | ---------- | ----------------- |
| user  | references | foreign_key: true |
| group | references | foreign_key: true |

### Association
- belongs_to :group
- belongs_to :user

## postsテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| title    | string     | null: false                    |
| sentence | text       | null: false                    |
| group    | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :group
- has_many :comments

## commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| post    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user
