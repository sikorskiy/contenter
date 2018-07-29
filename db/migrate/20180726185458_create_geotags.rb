class CreateGeotags < ActiveRecord::Migration[5.2]
  def change
    create_table :geotags do |t|
      t.string :name
      t.references :camp
      t.timestamps
    end
  end
end
