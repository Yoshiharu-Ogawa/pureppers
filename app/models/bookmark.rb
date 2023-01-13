class Bookmark < ApplicationRecord

  belongs_to :customer
  belongs_to :post

  # validatesを追加することで、重複しての登録を防ぐ
  # 具体的には、ロード中に２度以上連続で登録しようとすることを防ぐ
  validates :customer_id, uniqueness: { scope: :post_id }

end
