class AddRatingColumnsToCamps < ActiveRecord::Migration[5.2]
  def change
    add_column :camps, :is_rated_for_finishing, :boolean
    add_column :camps, :is_rated_for_approving, :boolean
  end
end
