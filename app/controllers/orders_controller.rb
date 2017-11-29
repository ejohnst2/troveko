class OrdersController < ApplicationController
  def create
    experience = Experience.find(params[:experience_id])
    order  = Order.create!(experience_sku: "", amount: experience.price, state: 'pending')

    redirect_to new_order_payment_path(order)
  end

  def show
    @order = Order.where(state: 'paid').find(params[:id])
  end

end
