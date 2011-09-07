class Users < ActiveRecord::Migration
  def self.up
    create_table "users" do |t|
      t.integer :id
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :password
      t.text :present_address
      t.string :permanent_address
      t.string :gender
      t.datetime :dob
      t.string :marital_status
      t.string :phone_number
      t.boolean :active, { :default => false }
    end
  end

  def self.down
  end
end
