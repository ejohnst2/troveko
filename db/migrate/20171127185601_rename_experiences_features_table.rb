class RenameExperiencesFeaturesTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :experience_features, :experiences_features
  end
end
