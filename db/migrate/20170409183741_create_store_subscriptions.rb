class CreateStoreSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :store_subscriptions do |t|
      t.integer :user_id
      t.integer :store_id

      t.timestamps
    end
  end
end
