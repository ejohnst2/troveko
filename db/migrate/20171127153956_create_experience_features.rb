class CreateExperienceFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :experience_features do |t|
      t.references :feature, foreign_key: true
      t.references :experience, foreign_key: true

      t.timestamps
    end
  end
end
