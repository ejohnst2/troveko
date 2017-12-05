class AddContributionToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :contribution, :boolean, default: false
  end
end
