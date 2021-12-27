class ChargesController < ApplicationController
  
  def create
    #API call for creating new customer
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    #API Call for charging customer
    @amount = current_user.cart.sub_total
    charge = Stripe::Charge.create({
      customer: customer_id,
      amount: @amount,
      description: "description about order",
      currency: 'usd',
    })
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end

end 