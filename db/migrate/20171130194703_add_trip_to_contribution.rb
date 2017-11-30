class AddTripToContribution < ActiveRecord::Migration[5.0]
  def change
    add_reference :contributions, :trip, foreign_key: true
  end
end
