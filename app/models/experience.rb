class Experience < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :features

  validates :price, presence: true, numericality: { only_integer: true }
  validates :title, presence: true, length: { minimum: 15 }
  validates :short_description, presence:true, length: { maximum: 100 }
  validates :long_description, presence:true, length: { minimum: 100 }, length: { minimum: 1000 }
  validates :address, presence: true, allow_blank: false, length: { minimum: 10 }
  validates :status, presence:true, default: false
  validates :capacity, presence:true, numericality: { only_integer: true }
end
