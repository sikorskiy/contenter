class AddColumnArchivedToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :is_archived, :boolean, default: false
  end
end
