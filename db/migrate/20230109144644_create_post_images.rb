class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|
      t.integer :user_id, null: false
      t.string  :gekidann_name, null: false
      t.string  :yakusya_name, null: false
      t.text    :post_content, null: false
      

      t.timestamps
    end
  end
end
