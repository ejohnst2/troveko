class Order < ApplicationRecord
  # after_create :send_request_email
  monetize :amount_cents
  belongs_to :trip

  def capture
    order = Order.where(state: 'paid', id: id).find(self.id)
    payment = JSON.parse(order.payment)
    charge = Stripe::Charge.retrieve(payment["id"])
    charge.capture

    order.update(payment: charge.to_json, state: 'fulfilled')
    UserMailer.trip_request(order.trip, order.trip.email).deliver_now
  end

  private

  # def send_request_email
  #   OrderMailer.request(current_user).deliver_now
  # end
end
