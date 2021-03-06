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

ActiveRecord::Schema.define(:version => 20130501225648) do

  create_table "budget_items", :force => true do |t|
    t.integer  "quantity"
    t.float    "price"
    t.integer  "markup"
    t.text     "detail"
    t.integer  "number"
    t.float    "import"
    t.integer  "budget_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "budget_items", ["budget_id"], :name => "index_budget_items_on_budget_id"

  create_table "budgets", :force => true do |t|
    t.string   "customer"
    t.string   "street"
    t.string   "locality"
    t.string   "with_payment"
    t.string   "file_number"
    t.string   "private_number"
    t.datetime "opening"
    t.date     "date"
    t.string   "offer"
    t.string   "delivery"
    t.string   "place_of_delivery"
    t.integer  "general_markup"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
