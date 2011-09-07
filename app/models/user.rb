class User < ActiveRecord::Base

  has_many :orders
  #  attr_protected :first_name (Wont allow the user enetred field data to store into the database)
  #   attr_readonly :first_name (Wont allow the user Updated data to store into the database)
  #   attribute_for_inspect :first_name
  #   attr_present? :first_name
  #  validates :id, :presence => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :username, :presence => true
  validates :password, :presence => true
  validates :present_address, :presence => true
  validates :permanent_address, :presence => true
  validates :gender, :presence => true
  validates :dob, :presence => true
  validates :marital_status, :presence => true
  validates :phone_number, :presence => true
  def activate
    self.activate = true
  end
  def deactivate
    self.activate = false
  end
  def self.authenticate(username,password)
    @user = User.find_by_username_and_password(username,password)
#    if self.active == true
#      redirect_to :controller => "products", :action => "new"
#    else
#      redirect_to :controller => "products", :action => "index"
#    end
  end
#  def initialize(attributes={})
#  date_hack(attributes, 'dob')
#  super(attributes)
#end
#
#def date_hack(attributes, property)
#  keys, values = [], []
#  attributes.each_key {|k| keys << k if k =~ /#{property}/ }.sort
#  keys.each { |k| values << attributes[k]; attributes.delete(k); }
#  attributes[property] = values.join("-")
#end


end