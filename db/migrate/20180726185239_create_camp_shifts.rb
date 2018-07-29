class CreateCampShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :camp_shifts do |t|
      t.date :start
      t.date :finish
      t.integer :price
      t.text :program
      t.text :comment
      t.references :camp
      t.timestamps
    end
  end
end
