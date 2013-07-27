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

ActiveRecord::Schema.define(:version => 20130727072318) do

  create_table "expense_histories", :force => true do |t|
    t.integer  "creditor_id"
    t.integer  "debtor_id"
    t.integer  "money"
    t.string   "memo"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "expense_histories", ["creditor_id"], :name => "index_expense_histories_on_creditor_id"
  add_index "expense_histories", ["debtor_id"], :name => "index_expense_histories_on_debtor_id"

  create_table "expenses", :force => true do |t|
    t.integer  "creditor_id"
    t.integer  "debtor_id"
    t.integer  "money"
    t.string   "memo"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "expenses", ["creditor_id"], :name => "index_expenses_on_creditor_id"
  add_index "expenses", ["debtor_id"], :name => "index_expenses_on_debtor_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "bank"
    t.string   "account_no"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
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
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
