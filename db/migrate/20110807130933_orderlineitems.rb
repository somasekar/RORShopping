class Orderlineitems < ActiveRecord::Migration
  def self.up
    create_table "orderlineitems" do |t|
      t.integer :user_id
      t.string :order_id
      t.string :product_id
      t.string :quantity
    end
  end

  def self.down
  end
end
