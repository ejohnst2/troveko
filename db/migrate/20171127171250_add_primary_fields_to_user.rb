class AddPrimaryFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :ngo, :boolean
    add_column :users, :admin, :boolean
  end
end
