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

ActiveRecord::Schema.define(version: 20160303213017) do

  create_table "accounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "company"
    t.string   "username"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
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

  create_table "awards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.string   "official_title"
    t.string   "summary"
    t.string   "url"
    t.boolean  "live"
    t.integer  "start_year"
    t.integer  "stop_year"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "username"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emails", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "address",    limit: 64, null: false
    t.string   "category",   limit: 8
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "emails", ["address"], name: "index_emails_on_address", unique: true, using: :btree
  add_index "emails", ["category"], name: "index_emails_on_category", using: :btree

  create_table "friendly_id_slugs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "notes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "noteable_type", limit: 32, null: false
    t.integer  "noteable_id",              null: false
    t.string   "contents"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "notes", ["noteable_type", "noteable_id"], name: "index_notes_on_noteable_type_and_noteable_id", using: :btree

  create_table "parties", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",                                         null: false
    t.string   "type",                                         null: false
    t.string   "url"
    t.text     "description",    limit: 65535
    t.integer  "start_year",                                   null: false
    t.integer  "stop_year"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "location",       limit: 32
    t.string   "official_title"
    t.string   "summary"
    t.string   "slug"
    t.boolean  "live",                         default: false
  end

  add_index "parties", ["name"], name: "index_parties_on_name", using: :btree
  add_index "parties", ["slug"], name: "index_parties_on_slug", using: :btree
  add_index "parties", ["start_year"], name: "index_parties_on_start_year", using: :btree
  add_index "parties", ["stop_year"], name: "index_parties_on_stop_year", using: :btree
  add_index "parties", ["type"], name: "index_parties_on_type", using: :btree

  create_table "phones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "category",              limit: 8
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "area_code",             limit: 3
    t.string   "central_office_number", limit: 3
    t.string   "subscriber_number",     limit: 4
  end

  add_index "phones", ["category"], name: "index_phones_on_category", using: :btree

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",                         null: false
    t.string   "type",           limit: 32,    null: false
    t.integer  "party_id",                     null: false
    t.string   "url"
    t.integer  "start_year",                   null: false
    t.integer  "stop_year"
    t.text     "description",    limit: 65535
    t.boolean  "live",                         null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "official_title"
    t.string   "summary"
    t.string   "slug"
  end

  add_index "projects", ["live"], name: "index_projects_on_live", using: :btree
  add_index "projects", ["name"], name: "index_projects_on_name", using: :btree
  add_index "projects", ["party_id"], name: "index_projects_on_party_id", using: :btree
  add_index "projects", ["slug"], name: "index_projects_on_slug", using: :btree
  add_index "projects", ["start_year"], name: "index_projects_on_start_year", using: :btree
  add_index "projects", ["stop_year"], name: "index_projects_on_stop_year", using: :btree
  add_index "projects", ["type"], name: "index_projects_on_type", using: :btree

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "project_id", null: false
    t.integer  "title_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "roles", ["project_id", "title_id"], name: "index_roles_on_project_id_and_title_id", unique: true, using: :btree
  add_index "roles", ["project_id"], name: "index_roles_on_project_id", using: :btree
  add_index "roles", ["title_id"], name: "index_roles_on_title_id", using: :btree

  create_table "titles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",                  null: false
    t.string   "category",   limit: 16, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "titles", ["category"], name: "index_titles_on_category", using: :btree
  add_index "titles", ["name"], name: "index_titles_on_name", using: :btree

  create_table "tools", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",                                  null: false
    t.string   "type",       limit: 16,                 null: false
    t.string   "category",   limit: 16,                 null: false
    t.boolean  "front_end",             default: false, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "fluency",    limit: 1,  default: 0,     null: false
    t.string   "slug"
  end

  add_index "tools", ["fluency"], name: "index_tools_on_fluency", using: :btree
  add_index "tools", ["name"], name: "index_tools_on_name", using: :btree
  add_index "tools", ["slug"], name: "index_tools_on_slug", using: :btree
  add_index "tools", ["type"], name: "index_tools_on_type", using: :btree

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "one_liner"
    t.text     "objective",              limit: 65535
    t.text     "summary",                limit: 65535
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wields", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "project_id", null: false
    t.integer  "tool_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "wields", ["project_id"], name: "index_wields_on_project_id", using: :btree
  add_index "wields", ["tool_id"], name: "index_wields_on_tool_id", using: :btree

end
