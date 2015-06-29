class AddIconToStores < ActiveRecord::Migration
  def change
    add_column :stores, :icon, :string
  end
end
