class AddChangeToRatingChangeType < ActiveRecord::Migration[5.2]
  def change
    add_column :rating_change_types, :change, :integer
  end
end
