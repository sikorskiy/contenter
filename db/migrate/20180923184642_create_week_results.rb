class CreateWeekResults < ActiveRecord::Migration[5.2]
  def change
    create_table :week_results do |t|
      t.references :user, foreign_key: true
      t.references :camp, foreign_key: true
      t.string :week_start
      t.boolean :is_finished
      t.boolean :is_approved

      t.timestamps
    end
  end
end
