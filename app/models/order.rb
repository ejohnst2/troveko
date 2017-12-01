class Order < ApplicationRecord
  monetize :amount_cents
  belongs_to :trips


  def capture
    order = Order.where(state: 'paid').find(self.id)
    payment = JSON.parse(order.payment)
    charge = Stripe::Charge.retrieve(payment["id"])
    charge.capture

    order.update(payment: charge.to_json, state: 'fulfilled')
  end
end
