class AddFinishedColumnToCamps < ActiveRecord::Migration[5.2]
  def change
    add_column :camps, :is_finished, :boolean
  end
end
