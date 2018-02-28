class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :state
      t.string :experience_sku
      t.integer :amount
      t.jsonb :payment

      t.timestamps
    end
  end
end
