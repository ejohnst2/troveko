class ChangeTripsColumnDefaultForStatus < ActiveRecord::Migration[5.0]
  def change
    change_column_default :trips, :status, false
  end
end
