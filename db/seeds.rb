# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([
    { name: 'アジア',
      body: 'エリア説明'
    },
    { name: 'ヨーロッパ',
      body: 'エリア説明'
    },
     { name: '北米',
      body: 'エリア説明'
    },
     { name: '南米',
      body: 'エリア説明'
    },
     { name: 'アフリカ',
      body: 'エリア説明'
    },
     { name: 'オーストラリア',
      body: 'エリア説明'
    },
])


Admin.create!(
   email: 'admin@test.com',
   password: '111111'
)


Member.create!(
  name: 'ユーザー',
  nick_name: 'ユーザー',
  introduction: 'こんにちは！',
  profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/image/IMG.jpeg"), filename:"IMG.jpeg"),
  email: 'member@test.com',
  password: '111111'
)

Post.create!([
  { title: "日本",
    body: '日本旅行。',
    caption: '#楽しかった',
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/image/日本.jpeg"), filename:"日本.jpeg"),
    category_id: 1,
    member_id: 1,
  },
   { title: "イタリア",
    body: 'イタリア旅行。',
    caption: '#楽しかった #豪華',
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/image/ベネチア.jpeg"), filename:"ベネチア.jpeg"),
    category_id: 2,
    member_id: 1,
  },
  { title: "アメリカ",
    body: 'アメリカ旅行。',
    caption: '#楽しかった #賑やか',
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/image/アメリカ.jpeg"), filename:"アメリカ.jpeg"),
    category_id: 3,
    member_id: 1,
  },
  { title: "ウユニ塩湖",
    body: 'ボリビア旅行。',
    caption: '#楽しかった #絶景',
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/image/ウユニ塩湖.jpeg"), filename:"ウユニ塩湖.jpeg"),
    category_id: 4,
    member_id: 1,
  },
  { title: "アフリカ",
    body: 'アフリカ旅行。',
    caption: '#楽しかった #自然',
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/image/ケニア.jpeg"), filename:"ケニア.jpeg"),
    category_id: 5,
    member_id: 1,
  },

  { title: "オーストラリア",
    body: 'オーストラリア旅行。',
    caption: '#楽しかった #海',
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/image/ホワイトヘブンビーチ.jpeg"), filename:"ホワイトヘブンビーチ.jpeg"),
    category_id: 6,
    member_id: 1,
  },

])
