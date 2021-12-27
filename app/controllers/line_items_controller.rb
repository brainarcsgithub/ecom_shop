class LineItemsController < ApplicationController
  
  def create
    chosen_product = Product.find(params[:product_id])
    if @current_cart.products.include?(chosen_product)
      @line_item = @current_cart.line_items.find_by(product_id: chosen_product)
      @line_item.quantity =+ 1
    else
      @line_item = LineItem.new
      @line_item.cart = @current_cart
      @line_item.product = chosen_product
      @line_item.sku_id = "sku#{chosen_product.id}"
      @line_item.quantity =+ 1
      @line_item.price = chosen_product.price * @line_item.quantity
    end
    @line_item.save(validate: false)
    redirect_to cart_path(@current_cart)
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to cart_path(@current_cart)
  end

  def add_quantity
    @line_item = LineItem.find(params[:id])
    @line_item.increment!(:quantity, 1)
    @line_item.save
    redirect_to cart_path(@current_cart)
  end

  def reduce_quantity
    @line_item = LineItem.find(params[:id])
    @line_item.decrement!(:quantity, 1)
    @line_item.save
    redirect_to cart_path(@current_cart)
  end




  private
  def line_item_params
    params.require(:line_item).permit(:quantity, :product_id, :cart_id, :price, :sku_id)
  end

end