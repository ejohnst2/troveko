class Order < ApplicationRecord
  monetize :amount_cents
  belongs_to :trip

  def capture
    order = Order.where(state: 'paid', id: id).find(self.id)
    payment = JSON.parse(order.payment)
    charge = Stripe::Charge.retrieve(payment["id"])
    charge.capture

    order.update(payment: charge.to_json, state: 'fulfilled')
  end
end
