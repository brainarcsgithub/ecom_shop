class AddSkuIdToLineItems < ActiveRecord::Migration[6.1]
  def change
    add_column :line_items, :sku_id, :integer
  end
end
