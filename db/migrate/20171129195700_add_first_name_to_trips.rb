class AddFirstNameToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :first_name, :string
  end
end


