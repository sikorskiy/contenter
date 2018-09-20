class AddIterationReferenceColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :camps, :iteration, foreign_key: true
  end
end
