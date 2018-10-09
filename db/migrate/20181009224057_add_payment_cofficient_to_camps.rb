class AddPaymentCofficientToCamps < ActiveRecord::Migration[5.2]
  def change
    add_column :camps, :payment_cofficient, :float
  end
end
