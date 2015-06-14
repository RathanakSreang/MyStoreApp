class CreateUserStores < ActiveRecord::Migration
  def change
    create_table :user_stores do |t|
      t.integer :user_id
      t.integer :store_id
      t.boolean :admin, default: false

      t.timestamps null: false
    end
    add_index :user_stores, :store_id
    add_index :user_stores, :user_id
  end
end
