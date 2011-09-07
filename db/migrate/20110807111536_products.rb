class Products < ActiveRecord::Migration
  def self.up
    create_table "products" do |t|
      t.string :product_cat
      t.string :product_sub_cat
      t.string :product_name
      t.string :product_model
      t.string :product_company
      t.integer :product_stock
      t.float :price_per_piece
    end
  end

  def self.down
  end
end
