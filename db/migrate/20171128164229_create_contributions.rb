class CreateContributions < ActiveRecord::Migration[5.0]
  def change
    create_table :contributions do |t|
      t.references :user, foreign_key: true
      t.references :fund, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
