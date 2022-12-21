class CreateTagPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_posts do |t|

      t.timestamps

      t.integer :tag_id, null: false
      t.integer :post_id, null: false

    end
  end
end
