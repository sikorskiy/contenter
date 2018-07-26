class CreateSeasonships < ActiveRecord::Migration[5.2]
  def change
    create_table :seasonships do |t|
      t.references :camp
      t.references :season_type
      t.timestamps
    end
  end
end
