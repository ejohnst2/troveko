class OrdersController < ApplicationController
  def create
    trip = Trip.find(params[:trip_id])
    order  = Order.create!(experience_sku: trip.experience.title, amount: trip.experience.price, state: 'pending', trip_id: trip.id)

    redirect_to new_order_payment_path(order)
  end

  def show
    @order = Order.where(state: ["paid", "fulfilled"]).find(params[:id])
  end

end
