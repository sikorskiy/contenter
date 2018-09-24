class AddDayToWeekResults < ActiveRecord::Migration[5.2]
  def change
    add_column :week_results, :day, :date
  end
end
