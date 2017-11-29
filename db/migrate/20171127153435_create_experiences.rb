class CreateExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :experiences do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.float :price_cents
      t.integer :capacity
      t.boolean :status
      t.string :address
      t.float :latitude
      t.float :longitude
      t.text :long_description
      t.string :short_description

      t.timestamps
    end
  end
end
