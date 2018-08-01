class RemoveCommentColumnFromCampShifts < ActiveRecord::Migration[5.2]
  def change
    remove_column :camp_shifts, :comment
  end
end
