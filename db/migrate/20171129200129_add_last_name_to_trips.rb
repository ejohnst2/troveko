class AddLastNameToTrips < ActiveRecord::Migration[5.0]
  def change
     add_column :trips, :last_name, :string
  end
end
