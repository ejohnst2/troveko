class Order < ApplicationRecord
  monetize :amount_cents
  belongs_to :trips
end
