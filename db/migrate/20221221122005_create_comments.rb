class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      t.references :customer, type: :bigint, null: false, foreign_key: true
      t.references :post, type: :bigint, null: false, foreign_key: true

      t.timestamps

      # t.integer :customer_id, null: false
      # t.integer :post_id, null: false
      # t.integer :main_comment_id, null: false
      t.string :comment_content, null: false

    end
  end
end
