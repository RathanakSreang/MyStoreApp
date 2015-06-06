class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :house_no
      t.string :street_no
      t.string :village
      t.string :commune
      t.string :district
      t.integer :province_id

      t.timestamps null: false
    end
  end
end
