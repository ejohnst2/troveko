class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.references :experience, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.references :user, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end
