class PaymentsController < ApplicationController
  before_action :set_trip, only: [:new, :create]
  before_action :authenticate_user!


  def new
  end

  def create
     # creates customer in Skype based on token
     customer = Stripe::Customer.create(
      source: params[:token],
      email:  current_user.email
    )

    # creates charge for order. does not charge credit card yet though (capture = false)
    @trip.orders.each do |order|

      charge = Stripe::Charge.create(
        customer:     customer.id,   # You should store this customer id and re-use it.
        amount:       order.amount_cents,
        description:  "Payment for experience #{order.sku} for order #{order.id}",
        currency:     order.amount.currency,
        capture:      false
      )

      # text hosts. phone numbers need to be added to database and repalced in to:
      @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
       @client.messages.create({
         from: ENV['TWILIO_NUMBER'],
         to: '+447378155080',
         body: "You have a booking at #{order.sku}. Please approve it in your profile"
       })

      order.update(payment: charge.to_json, state: 'paid')
    end

    current_user.update(customer_id: customer.id)

    render json: { url: order_path(@trip.orders.first) }

    rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_order_payment_path(@order)
  end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

end
