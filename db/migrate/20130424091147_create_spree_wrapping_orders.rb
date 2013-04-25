class CreateSpreeWrappingOrders < ActiveRecord::Migration
  def change
    create_table :spree_wrapping_orders do |t|
      t.integer :order_id
      t.integer :gift_wrapping_id

      t.timestamps
    end
  end
end
