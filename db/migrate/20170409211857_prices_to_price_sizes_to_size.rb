class PricesToPriceSizesToSize < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :sizes, :size 
    rename_column :items, :prices, :price
    change_column :items, :price, :decimal, precision: 9, scale: 2
  end
end
