class RemoveColumnFromCamps < ActiveRecord::Migration[5.2]
  def change
    remove_column :camps, :schedule, :string
  end
end
