class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :mission, :text
    add_column :users, :programs, :text
    add_column :users, :website, :string
  end
end

