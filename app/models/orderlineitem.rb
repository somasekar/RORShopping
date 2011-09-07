class Orderlineitem < ActiveRecord::Base
 belongs_to :orders
#  validates :id, :presence => true
#  validates :quantity, :presence => true
end