class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.references :badge
      t.string :name
      t.float :pay_coefficient
      t.integer :length
      t.timestamps
    end

    add_column :statuses, :prev_status_id, :integer
    add_column :statuses, :next_status_id, :integer
  end
end
