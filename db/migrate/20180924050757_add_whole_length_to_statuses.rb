class AddWholeLengthToStatuses < ActiveRecord::Migration[5.2]
  def change
    add_column :statuses, :whole_length, :integer
    add_column :statuses, :number, :integer
  end
end
