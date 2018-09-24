class CreateRatingChanges < ActiveRecord::Migration[5.2]
  def change
    create_table :rating_changes do |t|
      t.references :user, foreign_key: true
      t.references :rating_change_type, foreign_key: true
      t.string :comment
      t.integer :camp_id

      t.timestamps
    end
  end
end
