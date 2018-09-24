class ChangeColumnNameRatingChangeType < ActiveRecord::Migration[5.2]
  def change
    rename_column :rating_change_types, :type, :name
  end
end
