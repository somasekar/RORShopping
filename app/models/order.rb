class Order < ActiveRecord::Base
  belongs_to :user
  has_many :orderlineitems
  validate :user_id , :presence => true
  validate :order_number, :presence => true
  validates :shipping_address, :presence => true
  validates :billing_address, :presence => true
end