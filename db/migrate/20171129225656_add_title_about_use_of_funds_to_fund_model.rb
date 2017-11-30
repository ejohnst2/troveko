class AddTitleAboutUseOfFundsToFundModel < ActiveRecord::Migration[5.0]
  def change
    add_column :funds, :title, :string
    add_column :funds, :about, :text
    add_column :funds, :use_of_funds, :text
  end
end
