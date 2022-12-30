class Post < ApplicationRecord

  has_many :bookmarks
  has_many :tag_posts
  has_many :comments
  belongs_to :customer

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("posted_title LIKE?","#{word}")
    elsif search == "forward_match"
      @post = Post.where("posted_title LIKE?","#{word}%")
    elsif search == "backward_match"
      @post = Post.where("posted_title LIKE?","%#{word}")
    elsif search == "partial_match"
      @post = Post.where("posted_title LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end

end
