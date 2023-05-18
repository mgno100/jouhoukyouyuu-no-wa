# アプリケーション名
情報共有の「わ」

# アプリケーション概要
複数人での情報共有を手軽に行うことができるアプリケーションです。

# URL
https://jouhoukyouyuu-no-wa.onrender.com

# テスト用アカウント
- Basic認証パスワード：3333
- Basic認証ID：admin
- メールアドレス：test@test.com
- パスワード：ApG3bDwY5

# 利用方法
## グループ機能
---
1. トップページのヘッダーからユーザー新規登録を行います
1. グループ作成ボタンから、グループの内容（グループ名・内容文）を入力し作成します
1. 一覧ページから「参加」ボタンを押すと、他者が作成したグループに参加します

## 情報投稿
---
1. 一覧ページの投稿作成ボタンから、情報の内容（タイトル名・情報の内容文）を入力し投稿します

## コメント投稿
---
1. 一覧ページから情報をクリックして、情報の詳細を確認します
1. 返答したい情報があれば、コメントでメッセージを送ります

<br>

# アプリケーションを作成した背景
前職の実体験から、「複数人（10人以下）での情報共有が、スムーズに行えていない」という課題を抱えていました。そして、同様の課題を抱えている方も多いと推測し、この課題を解決できるアプリケーションを作成したいと考え、開発しました。

# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1cr4v3xMbznrogpg4wi4fi2K77ydK61dKDINUNA8POMg/edit?usp=sharing)

# 実装した機能についてのGIFと説明
## トップページ
- アプリケーションの概要が表示されます。

[![Image from Gyazo](https://i.gyazo.com/62fd9700f1e94d50dbe7a5d1356ca6f2.gif)](https://gyazo.com/62fd9700f1e94d50dbe7a5d1356ca6f2)

---
<br>

## ユーザー登録機能
- ユーザー管理はRailsのdeviseで実装しています。
- ユーザーがログインしていない場合は、デフォルトでトップページが表示されます。
- 下のGIFのように、ヘッダー右上の「ログイン」「新規登録」から各ページへ遷移できます。
- ログイン後はヘッダー左上部分の表示が「ログアウト」に変わり、そちらからログアウト処理を行うことができます。

[![Image from Gyazo](https://i.gyazo.com/ff73e6d21eb8a953d9470a40d0e66183.gif)](https://gyazo.com/ff73e6d21eb8a953d9470a40d0e66183)
[![Image from Gyazo](https://i.gyazo.com/cd18978d5c7dab2368d049f3e9bc5fcb.gif)](https://gyazo.com/cd18978d5c7dab2368d049f3e9bc5fcb)

---
<br>

## マイページ機能
- 「マイページ」ボタンから、マイページへ遷移できます。
- ヘッダーにログアウト、マイページ、グループ一覧ページへ遷移するボタンがあります。
- ユーザーの名前、所属、役職が表示されます。
- ユーザーが参加しているグループと作成したグループが、それぞれ一覧で見ることができます。
- グループのグループ名、紹介文、参加人数が、グループごとに一覧で見ることができます。

[![Image from Gyazo](https://i.gyazo.com/27adb4c1de736d720da3730a9db186b8.gif)](https://gyazo.com/27adb4c1de736d720da3730a9db186b8)

---
<br>

## グループ一覧機能
- ログインすると、一覧ページが表示されます。
- グループのグループ名、紹介文、参加人数、参加と詳細のボタンが、グループごとに一覧で見ることができます。
- グループ参加時は、グループ内ページへ遷移するボタンがあります。

[![Image from Gyazo](https://i.gyazo.com/1121299ff832f326355ae2bc11b365a0.gif)](https://gyazo.com/1121299ff832f326355ae2bc11b365a0)

---
<br>

## グループ作成機能
- 一覧ページ右上の「グループ作成」ボタンを押すとフォームが表示されます。
- 「グループ名」は必須項目として入力できます。
- 「グループの紹介文」は任意項目として入力できます。
- 「もどる」ボタンで、入力情報を破棄し一覧ページへ遷移でき、「作成する」ボタンで作成を完了することができます。

[![Image from Gyazo](https://i.gyazo.com/546fca6026795a30baf66578a122d4af.gif)](https://gyazo.com/546fca6026795a30baf66578a122d4af)

---
<br>

## グループ参加機能
- 一覧ページの「参加」ボタンをクリックすると、グループに参加でき、グループ内ページへ遷移します。

[![Image from Gyazo](https://i.gyazo.com/4471bf8b3d8461d6923818ded81b7b42.gif)](https://gyazo.com/4471bf8b3d8461d6923818ded81b7b42)

---
<br>

## グループ脱退機能
- マイページのグループ一覧の「脱退」ボタンをクリックすると、グループから脱退します。

[![Image from Gyazo](https://i.gyazo.com/b0f2bcfec2c7c2ae9c09d5750bb2667f.gif)](https://gyazo.com/b0f2bcfec2c7c2ae9c09d5750bb2667f)

---
<br>

## グループ詳細機能
- 「詳細」ボタンをクリックすると、グループの詳細ページに遷移します。
- ヘッダーの左上に、グループ一覧ページとマイページへ遷移するリンクがあります。
- グループのグループ名、作成者、紹介文、グループに参加しているユーザーを見ることができます。
- グループの作成者のみに「グループの編集」「削除」ボタンが表示されます。
- グループ参加者のみに、グループに参加しているユーザーが表示されます。

[![Image from Gyazo](https://i.gyazo.com/de5c6b66e17cdb510172ac841d0c4c07.gif)](https://gyazo.com/de5c6b66e17cdb510172ac841d0c4c07)
[![Image from Gyazo](https://i.gyazo.com/07081acf1ab035271757cee93d18fcd5.gif)](https://gyazo.com/07081acf1ab035271757cee93d18fcd5)

---
<br>

## グループ削除機能
- 詳細ページから「削除」ボタンをクリックすると、削除が完了します。
- 削除ボタンをクリック後は、マイページに遷移します。

[![Image from Gyazo](https://i.gyazo.com/4ba0476f24ae29d2c9ade26a738f78d7.gif)](https://gyazo.com/4ba0476f24ae29d2c9ade26a738f78d7)

---
<br>

## 情報一覧機能
- グループ内ページへ遷移すると、一覧ページが表示されます。
- 右側の画面の左上に、グループのグループ名が表示されます。
- 右側の画面に、情報のタイトル名、投稿者、投稿日時が、情報ごとに一覧で表示されます。
- 左側の画面の上に、ユーザーの名前が表示されます。
- 左側の画面の下に、グループへ参加しているユーザーの名前が表示されます。
- ユーザー名と「グループ一覧へ戻る」ボタンをクリックすると、それぞれマイページとグループ一覧ページへ遷移します。

[![Image from Gyazo](https://i.gyazo.com/50f31808311ba330fe77e5ad9c5f9625.gif)](https://gyazo.com/50f31808311ba330fe77e5ad9c5f9625)

---
<br>

## 情報投稿機能
- 一覧ページの「投稿作成」ボタンから、投稿ページへ遷移できます。
- 「タイトル名」「情報の内容文」は必須項目として入力できます。
- 「もどる」ボタンで、入力情報を破棄し一覧ページへ遷移でき、「投稿する」ボタンで投稿を完了することができます。
- 「投稿する」ボタンをクリック後は、一覧ページへ遷移します。

[![Image from Gyazo](https://i.gyazo.com/91ac24ba900cc5d316d56493f81685f2.gif)](https://gyazo.com/91ac24ba900cc5d316d56493f81685f2)

---
<br>

## 情報詳細機能
- 情報のタイトル名をクリックすると、情報の詳細ページに遷移します。
- ヘッダーの左上に、グループ内ページへ遷移するリンクがあります。
- 情報のタイトル名、投稿者、内容文を見ることができます。
- 情報の投稿者のみに「情報の編集」「削除」ボタンが表示されます。
- 情報に対するコメントを見ることができます。

[![Image from Gyazo](https://i.gyazo.com/c52c4b34d1f04c0b50dee8bb2dd8ba12.gif)](https://gyazo.com/c52c4b34d1f04c0b50dee8bb2dd8ba12)
[![Image from Gyazo](https://i.gyazo.com/b7687fe66f01ac49b2e191ae96eef3b9.gif)](https://gyazo.com/b7687fe66f01ac49b2e191ae96eef3b9)

---
<br>

## 情報編集・更新機能
- 詳細ページから「情報の編集」ボタンをクリックすると、編集フォームが表示されます。
- 情報のタイトル名、内容文を編集することができます。
- 「もどる」ボタンで、入力情報を破棄し詳細ページへ遷移でき、「変更する」ボタンをクリックすることで更新が完了します。
- 変更するボタンをクリック後は、詳細ページに遷移します。

[![Image from Gyazo](https://i.gyazo.com/71b54f5b9774e73a866649cb11917926.gif)](https://gyazo.com/71b54f5b9774e73a866649cb11917926)

---
<br>

## 情報削除機能
- 詳細ページから「削除」ボタンをクリックすると、削除が完了します。
- 削除ボタンをクリック後は、一覧ページに遷移します。

[![Image from Gyazo](https://i.gyazo.com/e9589baab1cf43a890e0251f5741c350.gif)](https://gyazo.com/e9589baab1cf43a890e0251f5741c350)

---
<br>

## コメント一覧機能
- 情報の詳細ページへ遷移すると、その情報に対するコメントが一覧で表示されます。
- コメントの投稿者、内容文が、コメントごとに一覧で表示されます。

[![Image from Gyazo](https://i.gyazo.com/c7b90de8fc3b2dc828b1ec963bfd44d8.gif)](https://gyazo.com/c7b90de8fc3b2dc828b1ec963bfd44d8)

---
<br>

## コメント投稿機能
- 情報の詳細ページにて、コメントを投稿できます。
- 「コメントの内容文」は必須項目として入力できます。

[![Image from Gyazo](https://i.gyazo.com/b1dfe7f213db0cec1b7637396935cc8a.gif)](https://gyazo.com/b1dfe7f213db0cec1b7637396935cc8a)

---
<br>

# 実装予定の機能
現在、グループ編集機能を実装中です。<br>
今後は、検索機能とページ付け機能を実装予定です。

<br>

# データベース設計
ER図はこちらになります。

[![Image from Gyazo](https://i.gyazo.com/3edb3c6b5cf1ef620578c9705a5a2747.png)](https://gyazo.com/3edb3c6b5cf1ef620578c9705a5a2747)


## 各テーブルの構成
---

## Users テーブル

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
---
<br>

## Groups テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| introduction | text       |                                |
| user         | references | null: false, foreign_key: true |

### Association

- has_many :users
- has_many :posts
- belongs_to :user
---
<br>

## Group_usersテーブル

| Colum | Type       | Options           |
| ----- | ---------- | ----------------- |
| user  | references | foreign_key: true |
| group | references | foreign_key: true |

### Association
- belongs_to :group
- belongs_to :user
---
<br>

## Postsテーブル

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
---
<br>

## Commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| post    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user
---
<br>

# 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/1acb2500a1a2f74b1920d823e2f66db2.png)](https://gyazo.com/1acb2500a1a2f74b1920d823e2f66db2)

<br>

# 使用技術

| 開発環境        | 詳細                                              |
| -------------  | ------------------------------------------------ |
| フロントエンド   | HTML/CSS                                         |
| バックエンド     | Ruby/Ruby on Rails/RSpec/RuboCop                 |
| データベース     | PostgreSQL                                       |
| バージョン管理   | Git/Github                                       |
| デプロイ        | Render                                           |
| テキストエディタ | VScode                                           |
| タスク管理      | GitHub Projects                                  |

- バージョン
  - Ruby：2.6.5
  - Ruby on Rails：6.0.6.1

----