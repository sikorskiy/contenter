class AddVersionNumberColumnToCamps < ActiveRecord::Migration[5.2]
  def change
    add_column :camps, :version_number, :integer, default: 0
  end
end
