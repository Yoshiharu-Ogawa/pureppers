class Comment < ApplicationRecord

  belongs_to :customer
  belongs_to :post

 # 顧客が「コメントが削除されました」というコメントのみを抽出するscope
  scope :delete_comments, -> { where(comment_content: 'コメントが削除されました') }

end
