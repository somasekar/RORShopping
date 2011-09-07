# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110807130933) do

  create_table "orderlineitems", :force => true do |t|
    t.integer "user_id"
    t.string  "order_id"
    t.string  "product_id"
    t.string  "quantity"
  end

  create_table "orders", :force => true do |t|
    t.string  "order_number"
    t.integer "user_id"
    t.text    "shipping_address"
    t.text    "billing_address"
  end

  create_table "products", :force => true do |t|
    t.string  "product_cat"
    t.string  "product_sub_cat"
    t.string  "product_name"
    t.string  "product_model"
    t.string  "product_company"
    t.integer "product_stock"
    t.float   "price_per_piece"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "password"
    t.text     "present_address"
    t.string   "permanent_address"
    t.string   "gender"
    t.datetime "dob"
    t.string   "marital_status"
    t.string   "phone_number"
    t.boolean  "active",            :default => false
  end

end
