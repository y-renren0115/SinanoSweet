# [SinanoSweet](https://sinanosweet.herokuapp.com/)
### ![SinanoSweet](/app/assets/images/sinanosweet.png)
### アプリURL: [https://sinanosweet.herokuapp.com/](https://sinanosweet.herokuapp.com/)

## サインイン・サインアップ方法
### 管理者ログイン
- メールアドレス: aaadmin@email.com, パスワード: aaadmin
- [こちらから管理者ログインできます](https://sinanosweet.herokuapp.com/admin/sign_in)

### 顧客ログイン
- メールアドレス: sinanotarou@email.com, パスワード: sinano

### 新規顧客登録
- 新規登録画面からお名前、メールアドレス、ご住所、パスワードをご登録いただくことで利用できます。

## サイトの概要
### サイト制作の背景
私の地元でもある長野県のとある場所にある子供から大人までの幅広い年齢層に愛されているスイーツ店の
スイーツを地元の人だけでなく日本全国からいつでもどこからでも注文を受け付けられるようにするために
開発したECサイトになります。一番人気の信濃ケーキをはじめ、様々な美味しいスイーツを扱っています！

### 基本機能概要
- 長野県の人気スイーツ店SinanoSweetから商品を購入するためのECサイトになっております。商品をご購入
される際は、まず新規会員登録を行っていただきます。そして商品一覧から現在販売中の気になる商品を見て
いただき、商品の詳細ページからお客様カートに商品を追加していただきます。そしてご購入される商品が決
まりましたら、注文画面に進んで必要な情報を入力していただけたらご注文確定となります。

## 使用技術・環境
### フロントエンド
- HTML5
- CSS3
- SCSS/SASS
- Bootstrap

### バックエンド
- Ruby 2.6.6
- Rails 5.2.6

### データベース
- PostgreSQL

### 本番環境
- Heroku

## 機能一覧
- 顧客新規登録/ログイン機能
- 顧客商品一覧/詳細機能
- 顧客商品検索機能
- 顧客ショッピングカート機能
- 顧客住所登録機能
- 顧客商品注文機能
- 顧客注文履歴一覧機能

- 管理者ログイン機能
- 管理者顧客一覧/詳細機能
- 管理者商品登録機能
- 管理者商品検索機能
- 管理者商品ジャンル登録機能
- 管理者注文一覧/詳細機能
- 管理者注文詳細閲覧機能

## 使用ライブラリ
- gem devise
- gem refire
- gem kaminari
- gem ransack
...

## ER図
### ![ER図](/app/assets/images/ERf.png)

## 詳細設計
### ![テーブル定義書](/app/assets/images/tablef.png)

## 今後の実装していく機能
- 顧客に対する商品のレコメンド機能
- 取扱商品の人気ランキング機能
- 取扱商品のレビュー機能
- Javascript/jQueryなどを使用したUI/UXの最適化
