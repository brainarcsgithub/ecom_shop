class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  belongs_to :order




# write total_price helper to find value of lineItem
  def total_price
    self.quantity.to_i * self.product.price.to_i
  end
  
end