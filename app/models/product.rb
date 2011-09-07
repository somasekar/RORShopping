class Product < ActiveRecord::Base
# belongs_to :order
# validates :id, :presence => true
  validates :product_cat, :presence => true
  validates :product_sub_cat, :presence => true
  validates :product_name, :presence => true
  validates :product_model, :presence => true
  validates :product_company, :presence => true
  validates :product_stock, :presence => true
  validates :price_per_piece, :presence => true
#  validates :inventory, :presence => true
end