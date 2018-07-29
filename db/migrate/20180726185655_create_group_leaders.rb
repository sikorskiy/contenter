class CreateGroupLeaders < ActiveRecord::Migration[5.2]
  def change
    create_table :group_leaders do |t|
      t.string :name
      t.text :role
      t.text :about
      t.references :camp
      t.timestamps
    end
  end
end
