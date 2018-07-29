class RemoveReferenceFromGeotags < ActiveRecord::Migration[5.2]
  def change
    remove_reference :geotags, :camp
  end
end
