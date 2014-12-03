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

ActiveRecord::Schema.define(version: 20131122214245) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "category_name", limit: 50, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entries", force: true do |t|
    t.string   "status",      limit: 1, default: "P"
    t.integer  "user_id",                             null: false
    t.integer  "category_id",                         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entries", ["user_id", "category_id"], name: "index_entries_on_user_id_and_category_id", using: :btree

  create_table "storages", force: true do |t|
    t.string   "title",      limit: 80, null: false
    t.text     "content",               null: false
    t.integer  "entry_id",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "storages", ["entry_id"], name: "index_storages_on_entry_id", using: :btree

  create_table "user_roles", force: true do |t|
    t.string   "role_name",  limit: 20, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",      limit: 25,  null: false
    t.string   "password_hash",             null: false
    t.string   "password_salt",             null: false
    t.integer  "user_role_id",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",         limit: 100
  end

  add_index "users", ["user_role_id"], name: "index_users_on_user_role_id", using: :btree

  create_table "votes", force: true do |t|
    t.integer  "count",      default: 0
    t.integer  "storage_id",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["storage_id"], name: "index_votes_on_storage_id", using: :btree

end
