class AddValueToCarts < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :value, :string
  end
end
