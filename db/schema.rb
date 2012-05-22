# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120510104731) do

  create_table "addresses", :force => true do |t|
    t.integer  "company_id"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "street"
    t.string   "country"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "addresses", ["company_id"], :name => "addresses_company_id_fk"

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "website"
    t.string   "contact"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "microposts", ["user_id", "created_at"], :name => "index_microposts_on_user_id_and_created_at"

  create_table "order_items", :force => true do |t|
    t.integer  "order_id",                                                 :null => false
    t.integer  "product_id",                                               :null => false
    t.decimal  "price",      :precision => 10, :scale => 0, :default => 0, :null => false
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
    t.integer  "quantity",                                  :default => 1, :null => false
  end

  add_index "order_items", ["order_id"], :name => "order_items_order_id_fk"
  add_index "order_items", ["product_id"], :name => "order_items_product_id_fk"

  create_table "orders", :force => true do |t|
    t.integer  "user_id",                                                  :null => false
    t.string   "status"
    t.decimal  "subtotal",   :precision => 10, :scale => 0, :default => 0, :null => false
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
  end

  add_index "orders", ["user_id"], :name => "orders_user_id_fk"

  create_table "product_types", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.integer  "price"
    t.text     "description"
    t.integer  "quantity"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "product_type"
    t.string   "weight"
  end

  add_index "products", ["company_id"], :name => "products_company_id_fk"

  create_table "shipping_addresses", :force => true do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "phone"
    t.integer  "order_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "shipping_addresses", ["order_id"], :name => "shipping_addresses_order_id_fk"

  create_table "shopping_cart_items", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "product_id", :null => false
    t.integer  "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "shopping_cart_items", ["product_id"], :name => "shopping_cart_items_product_id_fk"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  add_foreign_key "addresses", "companies", :name => "addresses_company_id_fk"

  add_foreign_key "order_items", "orders", :name => "order_items_order_id_fk"
  add_foreign_key "order_items", "products", :name => "order_items_product_id_fk"

  add_foreign_key "orders", "users", :name => "orders_user_id_fk"

  add_foreign_key "products", "companies", :name => "products_company_id_fk"

  add_foreign_key "shipping_addresses", "orders", :name => "shipping_addresses_order_id_fk"

  add_foreign_key "shopping_cart_items", "products", :name => "shopping_cart_items_product_id_fk"

end
