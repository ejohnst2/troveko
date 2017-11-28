class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :fa_icon

      t.timestamps
    end
  end
end
