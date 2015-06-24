class AddVisableToStoreLogos < ActiveRecord::Migration
  def change
    add_column :store_logos, :visible, :boolean
  end
end
