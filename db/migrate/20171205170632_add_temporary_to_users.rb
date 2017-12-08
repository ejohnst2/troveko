class AddTemporaryToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :temporary, :boolean, default: false
  end
end
