class AddAddressdetailsToExperience < ActiveRecord::Migration[5.0]
  def change
    add_column :experiences, :city, :string
    add_column :experiences, :postal_code, :string
    add_column :experiences, :country, :string
  end
end
