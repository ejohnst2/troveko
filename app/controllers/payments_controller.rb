class PaymentsController < ApplicationController
  before_action :set_order, only: [:new, :create]
  before_action :authenticate_user!


  def new
  end

  def create
     customer = Stripe::Customer.create(
      source: params[:token],
      email:  current_user.email
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @order.amount_cents,
      description:  "Payment for experience #{@order.experience_sku} for order #{@order.id}",
      currency:     @order.amount.currency,
      capture:      false
    )

    @order.update(payment: charge.to_json, state: 'paid')
    render json: { url: order_path(@order) }

    rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_order_payment_path(@order)
  end

  private

    def set_order
      @order = Order.where(state: 'pending').find(params[:order_id])
  end
end
