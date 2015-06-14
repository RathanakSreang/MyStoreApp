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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150612161416) do

  create_table "addresses", force: :cascade do |t|
    t.string   "house_no",    limit: 255
    t.string   "street_no",   limit: 255
    t.string   "village",     limit: 255
    t.string   "commune",     limit: 255
    t.string   "district",    limit: 255
    t.integer  "province_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "phone",       limit: 255
  end

  create_table "images", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "provinces", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "address_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "stores", ["name"], name: "index_stores_on_name", using: :btree

  create_table "sub_domains", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "store_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "sub_domains", ["name"], name: "index_sub_domains_on_name", unique: true, using: :btree
  add_index "sub_domains", ["store_id"], name: "index_sub_domains_on_store_id", using: :btree

  create_table "user_stores", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "store_id",   limit: 4
    t.boolean  "admin",      limit: 1, default: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "user_stores", ["store_id"], name: "index_user_stores_on_store_id", using: :btree
  add_index "user_stores", ["user_id"], name: "index_user_stores_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.integer  "role",                   limit: 4,   default: 0
    t.integer  "address_id",             limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.date     "dob"
    t.integer  "gender",                 limit: 4
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "url",                    limit: 255
    t.string   "avatar",                 limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
