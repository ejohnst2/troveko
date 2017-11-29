class CreateFunds < ActiveRecord::Migration[5.0]
  def change
    create_table :funds do |t|
      t.references :user, foreign_key: true
      t.integer :funding_goal

      t.timestamps
    end
  end
end
