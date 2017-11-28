class CreateExperienceActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities_experiences do |t|
      t.references :activity, foreign_key: true
      t.references :experience, foreign_key: true

      t.timestamps
    end
  end
end
