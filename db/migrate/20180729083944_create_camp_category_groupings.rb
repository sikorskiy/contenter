class CreateCampCategoryGroupings < ActiveRecord::Migration[5.2]
  def change
    create_table :camp_category_groupings do |t|
      t.references :camp_category
      t.references :camp_category_group

      t.timestamps
    end
  end
end
