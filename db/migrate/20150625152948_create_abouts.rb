class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
      t.text :content
      t.string :fb_link
      t.string :tw_link
      t.string :in_link
      t.string :gg_link
      t.integer :store_id

      t.timestamps null: false
    end
  end
end
