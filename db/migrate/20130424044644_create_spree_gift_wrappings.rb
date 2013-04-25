class CreateSpreeGiftWrappings < ActiveRecord::Migration
  def change
    create_table :spree_gift_wrappings do |t|
      t.string :description

      t.timestamps
    end
  end
end
