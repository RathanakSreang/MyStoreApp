class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :role, default: 0
      t.integer :address_id

      t.timestamps null: false
    end
  end
end
