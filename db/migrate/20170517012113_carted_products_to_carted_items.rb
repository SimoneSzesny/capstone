class CartedProductsToCartedItems < ActiveRecord::Migration[5.0]
  def change
    add_column :carted_products, :price, :decimal, precision: 9, scale: 2
  end
end
