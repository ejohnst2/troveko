class Contribution < ApplicationRecord
  belongs_to :user
  belongs_to :fund
  belongs_to :trip
  monetize :amount_cents
  validates :amount_cents, presence: true
end
