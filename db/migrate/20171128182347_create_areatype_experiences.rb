class CreateAreatypeExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :areatypes_experiences do |t|
      t.references :areatype, foreign_key: true
      t.references :experience, foreign_key: true

      t.timestamps
    end
  end
end
