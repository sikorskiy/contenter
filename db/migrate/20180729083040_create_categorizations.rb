class CreateCategorizations < ActiveRecord::Migration[5.2]
  def change
    create_table :categorizations do |t|
      t.references :camp_category
      t.references :camp
      t.timestamps
    end
  end
end
