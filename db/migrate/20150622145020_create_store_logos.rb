class CreateStoreLogos < ActiveRecord::Migration
  def change
    create_table :store_logos do |t|
      t.string :title
      t.string :description
      t.string :link
      t.string :logo
      t.integer :store_id
      t.timestamps null: false
    end
  end
end
