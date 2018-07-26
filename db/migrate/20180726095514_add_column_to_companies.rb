class AddColumnToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :entity, :string
  end
end
