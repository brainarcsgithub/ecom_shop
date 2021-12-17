class ChangePriceToBeDecimalInLineItems < ActiveRecord::Migration[6.1]
  def change
    change_column :line_items, :price, :decimal
  end
end
