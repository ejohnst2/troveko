class Trip < ApplicationRecord
  belongs_to :experience
  belongs_to :user
end
