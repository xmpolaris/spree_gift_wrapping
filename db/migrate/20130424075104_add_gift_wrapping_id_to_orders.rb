class AddGiftWrappingIdToOrders < ActiveRecord::Migration
  def change
    add_column :spree_orders, :gift_wrapping_id, :integer
  end
end

