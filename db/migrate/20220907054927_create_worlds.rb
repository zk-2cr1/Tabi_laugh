class CreateWorlds < ActiveRecord::Migration[6.1]
  def change
    create_table :worlds do |t|
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
