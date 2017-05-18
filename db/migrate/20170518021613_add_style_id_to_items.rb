class AddStyleIdToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :style_id, :integer
  end
end
