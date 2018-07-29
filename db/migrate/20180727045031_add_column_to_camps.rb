class AddColumnToCamps < ActiveRecord::Migration[5.2]
  def change
    add_column :camps, :edition, :string
  end
end
