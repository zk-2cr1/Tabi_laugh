class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer  :member_id, null: false
      t.integer  :category_id, null: false
      t.string   :title, null: false
      t.text     :body, null: false
      t.text     :caption, null: true
      t.integer  :status, null: false, default: 0

      t.timestamps
    end
  end
end
