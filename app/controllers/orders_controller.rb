class OrdersController < ApplicationController
  def create
    trip = Trip.find(params[:trip_id])
    order  = Order.create!(sku: trip.experience.title, amount: trip.experience.price, state: 'pending', trip_id: trip.id)
    if trip.contribution.amount > 0
      contribution_order = Order.create!(sku: trip.contribution.fund.title, amount: trip.contribution.amount, state: 'pending', trip_id: trip.id, contribution: true )
    end
    # UserMailer.trip_request(trip, trip.email).deliver_now
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = Order.where(state: ["paid", "fulfilled"]).find(params[:id])
  end

end
