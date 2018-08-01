class AddGroupLeaderAnounceToCamps < ActiveRecord::Migration[5.2]
  def change
    add_column :camps, :group_leader_anounce, :string
  end
end
