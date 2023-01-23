# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Tag.create([
    { tag_name: '防災' },
    { tag_name: '備蓄' },
    { tag_name: '食品'},
    { tag_name: '畑' },
    { tag_name: '燃焼'},
    { tag_name: '知識'},
    { tag_name: '薬' },
    { tag_name: '生活用品' },
    { tag_name: '衣類' },
    { tag_name: 'アウトドア' },
    { tag_name: 'エネルギー' },
    { tag_name: 'その他'}
    ])

Admin.create!(
  email: 'gworijob@wrghtw24',
  password: 'baorho42oi5hog89hs'
  )