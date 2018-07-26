class AddAndRemoveColumnsFromCamps < ActiveRecord::Migration[5.2]
  def change
    remove_column :camps, :anounce
    remove_column :camps, :program
    remove_column :camps, :meal
    remove_column :camps, :presentation
    remove_column :camps, :company
    add_reference :camps, :company
  end
end
