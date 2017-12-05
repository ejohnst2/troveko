class ChangeEndDateColumnInTrips < ActiveRecord::Migration[5.0]
  def change
    remove_column :trips, :end_date
    add_column :experiences, :duration, :integer
  end
end
