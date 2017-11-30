class AddCancelToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :cancel, :boolean, default: false
  end
end
