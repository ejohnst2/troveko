class AddNumberOfPeopleAndTermsToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :number_of_people, :integer
    add_column :trips, :terms_and_conditions, :boolean
  end
end
