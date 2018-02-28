class ChangeCentsAppendedToWithoutCents < ActiveRecord::Migration[5.0]
  def change
    rename_column :experiences, :price_cents, :price
    rename_column :orders, :amount_cents, :amount
    rename_column :contributions, :amount_cents, :amount
    rename_column :funds, :funding_goal_cents, :funding_goal
  end
end
