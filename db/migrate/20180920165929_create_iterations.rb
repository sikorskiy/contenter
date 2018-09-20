class CreateIterations < ActiveRecord::Migration[5.2]
  def change
    create_table :iterations do |t|
      t.string :text
      t.string :description

      t.timestamps
    end
  end
end
