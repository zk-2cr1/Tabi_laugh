class CreateWorldPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :world_posts do |t|
      t.references :world, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
