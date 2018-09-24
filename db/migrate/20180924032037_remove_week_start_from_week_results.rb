class RemoveWeekStartFromWeekResults < ActiveRecord::Migration[5.2]
  def change
    remove_column :week_results, :week_start
  end
end
