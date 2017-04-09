class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.integer :item_id
      t.string :image

      t.timestamps
    end
  end
end
