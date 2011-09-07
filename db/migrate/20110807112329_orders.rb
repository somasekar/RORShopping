class Orders < ActiveRecord::Migration
  def self.up
    create_table "orders" do |t|
      t.string :order_number
      t.integer :user_id
      t.text :shipping_address
      t.text :billing_address
    end
  end

  def self.down
  end
end
