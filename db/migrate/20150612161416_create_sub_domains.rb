class CreateSubDomains < ActiveRecord::Migration
  def change
    create_table :sub_domains do |t|
      t.string :name
      t.integer :store_id

      t.timestamps null: false
    end
    add_index :sub_domains, :name,                unique: true
    add_index :sub_domains, :store_id
  end
end
