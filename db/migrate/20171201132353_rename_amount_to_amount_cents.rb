class RenameAmountToAmountCents < ActiveRecord::Migration[5.0]
  def change
    rename_column :contributions, :amount, :amount_cents
  end
end