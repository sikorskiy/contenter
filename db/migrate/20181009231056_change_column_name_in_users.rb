class ChangeColumnNameInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :camps, :payment_cofficient, :pay_coefficient
  end
end
