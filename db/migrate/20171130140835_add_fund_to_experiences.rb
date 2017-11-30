class AddFundToExperiences < ActiveRecord::Migration[5.0]
  def change
    add_reference :experiences, :fund, index: true
  end
end

