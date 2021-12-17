class CartsController < ApplicationController

  def show
    @cart = @current_cart
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end

  def total_price
    line_items.to_a.sum {|item| item.total_price }
  end

  def increment
      @cart.value += 1
      @cart.save
  end

  def decrement
      @cart.value -= 1
      @cart.save
  end

  def remove
    @cart.value = 0
    @cart.save
  end

  def set_counter
      @cart = Cart.find_by_id(params[:id])
  end

end