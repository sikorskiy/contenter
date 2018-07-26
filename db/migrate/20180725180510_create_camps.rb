class CreateCamps < ActiveRecord::Migration[5.2]
  def change
    create_table :camps do |t|
      t.string :url
      t.string :company
      t.string :name
      t.boolean :presentation
      t.string :facebook
      t.string :vk
      t.string :incamp_url
      t.string :ml_url
      t.string :dt_url
      t.string :bc_url
      t.string :pd_url
      t.string :inlearno_url
      t.text :anounce
      t.text :program
      t.text :schedule
      t.text :meal

      t.timestamps
    end
  end
end
