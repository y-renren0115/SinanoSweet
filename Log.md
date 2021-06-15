# SinanoSweet 作業ログ

## 5/29(土)
### 01_feature_of_login(ログイン・サインアップ機能)
1.Gemの導入
 ✅1-1. deviseによるエンドユーザーとアドミンのログイン・サインアップ機能
 ✅1-2. rails db:seedによるアドミンの初期データセット
 ✅1-3. 名前空間によるエンドユーザーとアドミンのurlの切り分け
   1-4  各ページの共通ヘッダー作成
   1-5. 管理者トップページ作成
   1-6. 顧客トップページ作成
   1-7. ログイン後画面切り分け設定
#### 本日の作業ログ
+ 各種gemの導入
gem 'pry-byebug'
gem 'bootstrap-sass'
gem 'bootstrap','~> 4.5'
gem 'jquery-rails'
gem 'devise'
gem "refile", require: "refile/rails", github: 'manfe/refile'
gem "refile-mini_magick"

- bundle install
- rails g devise:install
+ rails g devise EndUser
+ rails g devise Admin
- config.scoped_views = true  # ←複数のmodelで個別のログイン画面を使う。　これをtrueにします。(devise.rb: 250行目付近)
- config.sign_out_all_scopes = false  #複数のモデルを扱う際、いずれかがログアウトした時に全てログアウトする。 これをfalseにします。

+ rails g controller customer/homes
+ rails g controller admin/homes

+ マイグレーションファイルの変更
  - enduser
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.string :phone_number
      t.string :postcode
      t.string :address
      t.boolean :is_active, default: true, null: false
  - admin

- rails db:migrate
+ アドミンユーザーの初期データ登録
+ Admin.create!(
    email: "aaadmin@email.com",
    password: "aaadmin"
)

+ application.htmlにてヘッダーの編集
  

## 6/8日(火)
1.ヘッダーの編集＆bootstrapのヘッダーデザイン

## 6/9日(水)
### itemsテーブル作成
 + rails g model Item
 + マイグレーションファイルの編集

## 6/11日(金)
(⭐️)+ エンドユーザーの新規登録,ログイン,パスワード再設定画面の編集完了！
~残りのタスク~
1.diveseの新規登録,ログインのパラメータの許可設定
2.アドミンのログイン画面の作成
3.アドミン,エンドユーザーの新規登録,ログイン後の画面遷移の設定

+ ユーザー1: name: テスト太郎, email: test01@email.com, phone: 09011003333, post: 3336699, 住所: 東京都江戸川区, pass: qwepoi

## 6/12日(土)
~ブランチ1のタスク~
1. アドミンのログイン画面の作成
2. アドミン,エンドユーザーのログイン・ログアウト後の遷移画面の設定
3. アドミン,エンドユーザーのログイン前後のヘッダーメニューの変更

## 6/13日(日) -昨日に引き続き-
1. アドミンのログイン画面の作成
2. アドミン,エンドユーザーのログイン・ログアウト後の遷移画面の設定
3. アドミン,エンドユーザーのログイン前後のヘッダーメニューの変更

(⭐️) 1.アドミンのログイン画面の作成完了！

2. アドミン,エンドユーザーのログイン・ログアウト後の遷移画面の設定
  2-1. ヘッダーに必要なアドミンのビューページの実装
  2-2. ヘッダーに必要なエンドユーザーのビューページの実装
  2-3. application.htmlのヘッダーバーの切り替え実装
  2-4. ログイン,ログアウト後のページ遷移の指定を記述

+ 見本サイトログインユーザー: kisaragi@email.com, qwepoi

### 2-1&2-2
+ customersコントローラーの作成: rails g controller customer/customers
+ customersのビューページの追加: +index.html.erb
+ cart_itemsコントローラーの作成: rails g controller customer/cart_items
+ cart_itemsのビューページの追加: inde.html.erb
-adminヘッダー-
+ ・・・

(⭐️)2-1&2-2実装完了！

### 2-3 application.html.erbのヘッダーバーの切り替え
+ application_controllerの処理を実装
(⭐️) 2-3&2-4 実装(暫定)完了！

## 6/14日(月)
(⭐️) +アドミン,エンドユーザーの各コントローラーにlayoutオプションで個別ページを指定して切り分け完了！