# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do |n|
  EndUser.create!(
    last_name: "テスト",
    first_name: "ユーザー#{n + 1}",
    last_name_kana: "テスト",
    first_name_kana: "ユーザー#{n + 1}",
    email: "test_user#{n+1}@email.com",
    phone_number: "09033336699",
    postcode: "1236789",
    address: "東京都港区",
    password: "test0123"
  )
end


Admin.create!(
    email: "aaadmin@email.com",
    password: "aaadmin"
)

Genre.create!(
  [
    {
      name: 'ケーキ'
    },
    {
      name: 'プリン'
    },
    {
      name: 'アイス'
    }
  ]
)

Item.create!(
  [
    {
      genre_id: 1,
      name: '信濃ケーキ',
      introduction: '本店イチオシの美味しいケーキです！',
      image_id: File.open('app/assets/images/shinanocake.jpg'),
      price: 500
    },
    {
      genre_id: 2,
      name: '抹茶プリン',
      introduction: '大人な甘さ控えめの美味しいプリンです！',
      image_id: File.open('app/assets/images/mattyapurin.jpg'),
      price: 400
    },
    {
      genre_id: 3,
      name: 'いちごソフト',
      introduction: '苺をたっぷり使った美味しいソフトクリームです！',
      image_id: File.open('app/assets/images/itigosohuto.jpg'),
      price: 300
    }
  ]
)