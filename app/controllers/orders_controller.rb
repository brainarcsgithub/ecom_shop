class OrdersController < ApplicationController
  
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    if user_signed_in?
    @order = Order.new
  else
    redirect_to new_user_session_path, alert:"Please Sign in for checkout"
  end
  end

  def create
    @order = Order.new(new_params_order)
    @current_cart.line_items.each do |item|
      @order.line_items << item
      item.update(cart_id: nil)
    end
    @order.save
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    redirect_to root_path
  end



  private

  def new_params_order
    params.require(:order).permit(:customer_id, :date, :name, :email, :address, :pay_method, :price)
  end
end