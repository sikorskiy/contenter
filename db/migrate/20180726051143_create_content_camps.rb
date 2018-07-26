class CreateContentCamps < ActiveRecord::Migration[5.2]
  def change
    create_table :content_camps do |t|
      t.references :camps
      t.boolean :presentation
      t.text :anounce
      t.text :program
      t.text :schedule
      t.text :meal
      t.timestamps
    end
  end
end
