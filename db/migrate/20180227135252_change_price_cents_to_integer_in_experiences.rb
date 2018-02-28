class ChangePriceCentsToIntegerInExperiences < ActiveRecord::Migration[5.0]
  def change
    change_column :experiences, :price_cents, :integer
  end
end
