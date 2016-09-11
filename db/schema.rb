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

ActiveRecord::Schema.define(version: 20160911165314) do

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
    t.index ["city"], name: "index_addresses_on_city", using: :btree
    t.index ["state"], name: "index_addresses_on_state", using: :btree
    t.index ["zip"], name: "index_addresses_on_zip", using: :btree
  end

  create_table "awards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
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
    t.index ["address"], name: "index_emails_on_address", unique: true, using: :btree
    t.index ["category"], name: "index_emails_on_category", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "interests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",        limit: 32,                 null: false
    t.integer  "sort",                                   null: false
    t.string   "token",       limit: 32
    t.string   "work_name",   limit: 32,                 null: false
    t.string   "series_name", limit: 32,                 null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "slug"
    t.string   "icon",        limit: 32
    t.boolean  "public",                 default: false, null: false
    t.index ["public"], name: "index_interests_on_public", using: :btree
    t.index ["slug"], name: "index_interests_on_slug", using: :btree
    t.index ["sort"], name: "index_interests_on_sort", using: :btree
    t.index ["token"], name: "index_interests_on_token", using: :btree
  end

  create_table "notes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "noteable_type", limit: 32, null: false
    t.integer  "noteable_id",              null: false
    t.string   "contents"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["noteable_type", "noteable_id"], name: "index_notes_on_noteable_type_and_noteable_id", using: :btree
  end

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
    t.index ["name"], name: "index_parties_on_name", using: :btree
    t.index ["slug"], name: "index_parties_on_slug", using: :btree
    t.index ["start_year"], name: "index_parties_on_start_year", using: :btree
    t.index ["stop_year"], name: "index_parties_on_stop_year", using: :btree
    t.index ["type"], name: "index_parties_on_type", using: :btree
  end

  create_table "phones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "category",              limit: 8
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "area_code",             limit: 3
    t.string   "central_office_number", limit: 3
    t.string   "subscriber_number",     limit: 4
    t.index ["category"], name: "index_phones_on_category", using: :btree
  end

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
    t.index ["live"], name: "index_projects_on_live", using: :btree
    t.index ["name"], name: "index_projects_on_name", using: :btree
    t.index ["party_id"], name: "index_projects_on_party_id", using: :btree
    t.index ["slug"], name: "index_projects_on_slug", using: :btree
    t.index ["start_year"], name: "index_projects_on_start_year", using: :btree
    t.index ["stop_year"], name: "index_projects_on_stop_year", using: :btree
    t.index ["type"], name: "index_projects_on_type", using: :btree
  end

  create_table "pursuits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",            null: false
    t.string   "unit_name",       null: false
    t.string   "collection_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["name"], name: "index_pursuits_on_name", using: :btree
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "work_id",    null: false
    t.integer  "title_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title_id"], name: "index_roles_on_title_id", using: :btree
    t.index ["work_id", "title_id"], name: "index_roles_on_work_id_and_title_id", unique: true, using: :btree
    t.index ["work_id"], name: "index_roles_on_work_id", using: :btree
  end

  create_table "series", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",                      null: false
    t.string   "summary"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "series_works", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "series_id",  null: false
    t.integer  "work_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "titles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",                  null: false
    t.string   "category",   limit: 16, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["category"], name: "index_titles_on_category", using: :btree
    t.index ["name"], name: "index_titles_on_name", using: :btree
  end

  create_table "tools", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",                                  null: false
    t.string   "type",       limit: 16,                 null: false
    t.string   "category",   limit: 16,                 null: false
    t.boolean  "front_end",             default: false, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "fluency",    limit: 1,  default: 0,     null: false
    t.string   "slug"
    t.index ["fluency"], name: "index_tools_on_fluency", using: :btree
    t.index ["name"], name: "index_tools_on_name", using: :btree
    t.index ["slug"], name: "index_tools_on_slug", using: :btree
    t.index ["type"], name: "index_tools_on_type", using: :btree
  end

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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "wields", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "work_id",    null: false
    t.integer  "tool_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tool_id"], name: "index_wields_on_tool_id", using: :btree
    t.index ["work_id"], name: "index_wields_on_work_id", using: :btree
  end

  create_table "works", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",                                         null: false
    t.integer  "interest_id",                                  null: false
    t.integer  "party_id",                                     null: false
    t.string   "url"
    t.integer  "start_year",                                   null: false
    t.integer  "stop_year"
    t.text     "description",    limit: 65535
    t.string   "summary"
    t.boolean  "live",                         default: true,  null: false
    t.string   "slug"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "status",         limit: 16,    default: "pre", null: false
    t.string   "status_message"
    t.index ["interest_id"], name: "index_works_on_interest_id", using: :btree
    t.index ["live"], name: "index_works_on_live", using: :btree
    t.index ["party_id"], name: "index_works_on_party_id", using: :btree
    t.index ["slug"], name: "index_works_on_slug", using: :btree
    t.index ["start_year"], name: "index_works_on_start_year", using: :btree
    t.index ["status"], name: "index_works_on_status", using: :btree
    t.index ["stop_year"], name: "index_works_on_stop_year", using: :btree
  end

end
