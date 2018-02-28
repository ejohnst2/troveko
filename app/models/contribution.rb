class Contribution < ApplicationRecord
  belongs_to :user
  belongs_to :fund
  belongs_to :trip
  monetize :amount
  validates :amount, presence: true
end
