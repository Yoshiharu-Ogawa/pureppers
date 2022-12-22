class Post < ApplicationRecord

  has_many :bookmarks
  has_many :tag_posts
  has_many :comments
  belongs_to :customer


end
