class AddReferenceForUserToCamps < ActiveRecord::Migration[5.2]
  def change
    add_reference :camps, :user
  end
end
