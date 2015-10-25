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

ActiveRecord::Schema.define(version: 20151025154839) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street",     limit: 64, null: false
    t.string   "unit",       limit: 32
    t.string   "city",       limit: 64, null: false
    t.string   "state",      limit: 2,  null: false
    t.string   "zip",        limit: 12, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "addresses", ["city"], name: "index_addresses_on_city", using: :btree
  add_index "addresses", ["state"], name: "index_addresses_on_state", using: :btree
  add_index "addresses", ["zip"], name: "index_addresses_on_zip", using: :btree

  create_table "emails", force: :cascade do |t|
    t.string   "address",    limit: 64, null: false
    t.string   "category",   limit: 8
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "emails", ["address"], name: "index_emails_on_address", unique: true, using: :btree
  add_index "emails", ["category"], name: "index_emails_on_category", using: :btree

  create_table "notes", force: :cascade do |t|
    t.string   "noteable_type", limit: 32,  null: false
    t.integer  "noteable_id",   limit: 4,   null: false
    t.string   "contents",      limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "notes", ["noteable_type", "noteable_id"], name: "index_notes_on_noteable_type_and_noteable_id", using: :btree

  create_table "parties", force: :cascade do |t|
    t.string   "name",        limit: 255,   null: false
    t.string   "type",        limit: 255,   null: false
    t.string   "url",         limit: 255
    t.text     "description", limit: 65535
    t.integer  "start_year",  limit: 4,     null: false
    t.integer  "stop_year",   limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "location",    limit: 32
  end

  add_index "parties", ["name"], name: "index_parties_on_name", using: :btree
  add_index "parties", ["start_year"], name: "index_parties_on_start_year", using: :btree
  add_index "parties", ["stop_year"], name: "index_parties_on_stop_year", using: :btree
  add_index "parties", ["type"], name: "index_parties_on_type", using: :btree

  create_table "phones", force: :cascade do |t|
    t.string   "number",     limit: 32
    t.string   "category",   limit: 8
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "phones", ["category"], name: "index_phones_on_category", using: :btree
  add_index "phones", ["number"], name: "index_phones_on_number", unique: true, using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name",        limit: 255,   null: false
    t.string   "type",        limit: 32,    null: false
    t.integer  "party_id",    limit: 4,     null: false
    t.string   "url",         limit: 255
    t.integer  "start_year",  limit: 4,     null: false
    t.integer  "stop_year",   limit: 4
    t.text     "description", limit: 65535
    t.boolean  "live",        limit: 1,     null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "projects", ["live"], name: "index_projects_on_live", using: :btree
  add_index "projects", ["name"], name: "index_projects_on_name", using: :btree
  add_index "projects", ["party_id"], name: "index_projects_on_party_id", using: :btree
  add_index "projects", ["start_year"], name: "index_projects_on_start_year", using: :btree
  add_index "projects", ["stop_year"], name: "index_projects_on_stop_year", using: :btree
  add_index "projects", ["type"], name: "index_projects_on_type", using: :btree

  create_table "roles", force: :cascade do |t|
    t.integer  "project_id", limit: 4, null: false
    t.integer  "title_id",   limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "roles", ["project_id"], name: "index_roles_on_project_id", using: :btree
  add_index "roles", ["title_id"], name: "index_roles_on_title_id", using: :btree

  create_table "titles", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "category",   limit: 16,  null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "titles", ["category"], name: "index_titles_on_category", using: :btree
  add_index "titles", ["name"], name: "index_titles_on_name", using: :btree

  create_table "tools", force: :cascade do |t|
    t.string   "name",       limit: 255,                 null: false
    t.string   "type",       limit: 16,                  null: false
    t.string   "category",   limit: 16,                  null: false
    t.boolean  "front_end",  limit: 1,   default: false, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "tools", ["name"], name: "index_tools_on_name", using: :btree
  add_index "tools", ["type"], name: "index_tools_on_type", using: :btree

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wields", force: :cascade do |t|
    t.integer  "project_id", limit: 4, null: false
    t.integer  "tool_id",    limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "wields", ["project_id"], name: "index_wields_on_project_id", using: :btree
  add_index "wields", ["tool_id"], name: "index_wields_on_tool_id", using: :btree

end
