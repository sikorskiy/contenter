class CreateTaggizations < ActiveRecord::Migration[5.2]
  def change
    create_table :taggizations do |t|
      t.references :camp, foreign_key: true
      t.references :geotag, foreign_key: true

      t.timestamps
    end
  end
end
