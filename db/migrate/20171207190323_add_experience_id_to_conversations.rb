class AddExperienceIdToConversations < ActiveRecord::Migration[5.0]
  def change
    add_reference :conversations, :experience, foreign_key: true
  end
end
