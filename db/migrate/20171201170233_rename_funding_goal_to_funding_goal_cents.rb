class RenameFundingGoalToFundingGoalCents < ActiveRecord::Migration[5.0]
  def change
    rename_column :funds, :funding_goal, :funding_goal
  end
end
