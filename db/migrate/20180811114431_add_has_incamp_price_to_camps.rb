class AddHasIncampPriceToCamps < ActiveRecord::Migration[5.2]
  def change
    add_column :camps, :has_incamp_price, :boolean
  end
end
