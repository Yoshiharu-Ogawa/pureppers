# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Tag.create([
#     { tag_name: '防災' },
#     { tag_name: '備蓄' },
#     { tag_name: '食品'},
#     { tag_name: '畑' },
#     { tag_name: '燃焼'},
#     { tag_name: '知識'},
#     { tag_name: '薬' },
#     { tag_name: '生活用品' },
#     { tag_name: '世界情勢' },
#     { tag_name: '政治経済' },
#     { tag_name: '衣類' },
#     { tag_name: 'アウトドア' },
#     { tag_name: 'エネルギー' },
#     { tag_name: 'その他'}
#     ])

# idをつけることで、idはユニークデータのため重複できなくなる
tags = [
  { id: 1, tag_name: '防災' },
  { id: 2, tag_name: '備蓄' },
  { id: 3, tag_name: '食品'},
  { id: 4, tag_name: '畑' },
  { id: 5, tag_name: '燃焼'},
  { id: 6, tag_name: '知識'},
  { id: 7, tag_name: '薬' },
  { id: 8, tag_name: '生活用品' },
  { id: 9, tag_name: '世界情勢' },
  { id: 10, tag_name: '政治経済' },
  { id: 11, tag_name: '衣類' },
  { id: 12, tag_name: 'アウトドア' },
  { id: 13, tag_name: 'エネルギー' },
  { id: 14, tag_name: 'その他'}
]

# find_or_create_by このメソッドは、既に同じレコードが存在していればスキップし、存在していないレコードは新規作成
tags.each do |tag|
  Tag.find_or_create_by(tag)
end

Admin.create!(
  email: 'gworijob@wrghtw24',
  password: 'baorho42oi5hog89hs'
  )