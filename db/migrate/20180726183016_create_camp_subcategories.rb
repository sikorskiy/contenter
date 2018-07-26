class CreateCampSubcategories < ActiveRecord::Migration[5.2]
  def change
    create_table :camp_subcategories do |t|
      t.string :name

      t.timestamps
    end
    #add_reference :camp_subcategories, :camp_categories
  end
end
