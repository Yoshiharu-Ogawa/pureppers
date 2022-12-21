class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.timestamps
      
      t.integer :customer_id, null: false
      t.string :posted_title, null: false
      t.text :posted_body, null: false
      
    end
  end
end
