class AddEmailToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :email, :string
  end
end
