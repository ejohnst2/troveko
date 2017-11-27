class Experience < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :features

  validates :price, presence: true
  validates :title, presence: true, length: { minimum: 10 }
  validates :short_description, presence:true, length: { maximum: 100 }
  validates :long_description, presence:true, length: { minimum: 100 }, length: { maximum: 1000 }
  validates :address, presence: true, allow_blank: false, length: { minimum: 5 }
  validates :capacity, presence:true, numericality: { only_integer: true }

  # before_validation :assign_default_status
  # validates :status, presence: true
  # numericality: { only_integer: true }

  # private
  # def assign_default_status
  #   self.status ||= false
  # end
end
