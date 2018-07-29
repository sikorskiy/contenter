class AddColumnScheduleToCamps < ActiveRecord::Migration[5.2]
  def change
    add_column :camps, :schedule, :text
  end
end
