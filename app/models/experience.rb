class Experience < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :features

  validates :price, :name, :short_description, :long_description, :address, presence: true, allow_blank: false

end
