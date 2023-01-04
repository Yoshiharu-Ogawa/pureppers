class Post < ApplicationRecord

  has_many :bookmarks, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :comments, dependent: :destroy
  # thoroughを使うことで、post_tags経由でitemsにアクセスできるようになってます。
  has_many :tags, through: :post_tags
  belongs_to :customer

  has_one_attached :front_image

  def get_front_image(width, height)
    unless front_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      front_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    front_image.variant(resize_to_limit: [width, height]).processed
  end

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @post = Post.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @post = Post.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @post = Post.where("title LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end

end
