class AddHighlightsGuidedTransportationToExperiences < ActiveRecord::Migration[5.0]
  def change
    add_column :experiences, :highlights, :text
    add_column :experiences, :transportation, :text
    add_column :experiences, :guided, :boolean
  end
end
