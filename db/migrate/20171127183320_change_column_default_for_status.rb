class ChangeColumnDefaultForStatus < ActiveRecord::Migration[5.0]
  def change
    change_column_default :experiences, :status, false
  end
end
