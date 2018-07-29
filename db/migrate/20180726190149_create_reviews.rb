class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :review_text
      t.string :name
      t.boolean :is_negative
      t.references :review_role

      t.timestamps
    end
  end
end
