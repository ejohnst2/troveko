class RenameExperienceSkuToSku < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :experience_sku, :sku
  end
end
