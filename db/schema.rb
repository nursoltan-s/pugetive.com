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

ActiveRecord::Schema.define(version: 20180110034020) do

  create_table "accounts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "username"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "interest_id", null: false
    t.integer "start_year"
    t.integer "stop_year"
  end

  create_table "addresses", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "street", limit: 64, null: false
    t.string "unit", limit: 32
    t.string "city", limit: 64, null: false
    t.string "state", limit: 2, null: false
    t.string "zip", limit: 12, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city"], name: "index_addresses_on_city"
    t.index ["state"], name: "index_addresses_on_state"
    t.index ["zip"], name: "index_addresses_on_zip"
  end

  create_table "awards", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "official_title"
    t.string "summary"
    t.string "url"
    t.boolean "live"
    t.integer "start_year"
    t.integer "stop_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "documentable_id", null: false
    t.string "documentable_type", null: false
    t.string "data_file_name"
    t.string "data_content_type"
    t.integer "data_file_size"
    t.datetime "data_updated_at"
    t.index ["documentable_type", "documentable_id"], name: "index_documents_on_documentable_type_and_documentable_id"
    t.index ["name"], name: "index_documents_on_name"
  end

  create_table "emails", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "address", limit: 64, null: false
    t.string "category", limit: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_emails_on_address", unique: true
    t.index ["category"], name: "index_emails_on_category"
  end

  create_table "flickr_urls", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "work_id", null: false
    t.string "flickraw_token", null: false
    t.string "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flickraw_token"], name: "index_flickr_urls_on_flickraw_token"
    t.index ["work_id", "flickraw_token"], name: "index_flickr_urls_on_work_id_and_flickraw_token", unique: true
    t.index ["work_id"], name: "index_flickr_urls_on_work_id"
  end

  create_table "friendly_id_slugs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "genres", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "interest_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["interest_id"], name: "index_genres_on_interest_id"
    t.index ["name"], name: "index_genres_on_name"
    t.index ["slug"], name: "index_genres_on_slug"
  end

  create_table "icons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 32, null: false
    t.string "type", limit: 16, null: false
    t.string "token", limit: 32, null: false
    t.string "category", default: "site", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_icons_on_name"
    t.index ["type"], name: "index_icons_on_type"
  end

  create_table "images", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "imageable_id", null: false
    t.string "imageable_type", null: false
    t.string "data_file_name", null: false
    t.string "data_content_type", null: false
    t.integer "data_file_size", null: false
    t.datetime "data_uploaded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_content_type"], name: "index_images_on_data_content_type"
    t.index ["data_file_name"], name: "index_images_on_data_file_name"
    t.index ["data_file_size"], name: "index_images_on_data_file_size"
    t.index ["data_uploaded_at"], name: "index_images_on_data_uploaded_at"
    t.index ["imageable_id", "imageable_type"], name: "index_images_on_imageable_id_and_imageable_type"
  end

  create_table "interests", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 32, null: false
    t.integer "sort", null: false
    t.string "token", limit: 32
    t.string "work_name", limit: 32, null: false
    t.string "series_name", limit: 32, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "icon", limit: 32
    t.boolean "public", default: false, null: false
    t.string "summary"
    t.index ["public"], name: "index_interests_on_public"
    t.index ["slug"], name: "index_interests_on_slug"
    t.index ["sort"], name: "index_interests_on_sort"
    t.index ["token"], name: "index_interests_on_token"
  end

  create_table "keys", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", limit: 16, null: false
    t.string "short_name", limit: 4, null: false
    t.string "slug", limit: 16
    t.index ["name"], name: "index_keys_on_name"
    t.index ["short_name"], name: "index_keys_on_short_name"
    t.index ["slug"], name: "index_keys_on_slug"
  end

  create_table "lyrics", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "work_id"
    t.text "content", limit: 16777215
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["work_id"], name: "index_lyrics_on_work_id", unique: true
  end

  create_table "notes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "noteable_type", limit: 32, null: false
    t.integer "noteable_id", null: false
    t.string "contents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["noteable_type", "noteable_id"], name: "index_notes_on_noteable_type_and_noteable_id"
  end

  create_table "parties", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.string "type", null: false
    t.string "url"
    t.text "description"
    t.integer "start_year", null: false
    t.integer "stop_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location", limit: 32
    t.string "official_title"
    t.string "summary"
    t.string "slug"
    t.boolean "live", default: false
    t.boolean "alias", default: false, null: false
    t.index ["alias"], name: "index_parties_on_alias"
    t.index ["name"], name: "index_parties_on_name"
    t.index ["slug"], name: "index_parties_on_slug"
    t.index ["start_year"], name: "index_parties_on_start_year"
    t.index ["stop_year"], name: "index_parties_on_stop_year"
    t.index ["type"], name: "index_parties_on_type"
  end

  create_table "phones", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "category", limit: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "area_code", limit: 3
    t.string "central_office_number", limit: 3
    t.string "subscriber_number", limit: 4
    t.index ["category"], name: "index_phones_on_category"
  end

  create_table "places", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.integer "parent_id"
    t.integer "lft", null: false
    t.integer "rgt", null: false
    t.integer "depth", default: 0, null: false
    t.integer "children_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["lft"], name: "index_places_on_lft"
    t.index ["parent_id"], name: "index_places_on_parent_id"
    t.index ["rgt"], name: "index_places_on_rgt"
    t.index ["slug"], name: "index_places_on_slug"
  end

  create_table "roles", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "work_id", null: false
    t.integer "title_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title_id"], name: "index_roles_on_title_id"
    t.index ["work_id", "title_id"], name: "index_roles_on_work_id_and_title_id", unique: true
    t.index ["work_id"], name: "index_roles_on_work_id"
  end

  create_table "series", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "type", limit: 16, default: "Album", null: false
    t.string "name", null: false
    t.string "summary"
    t.text "description", limit: 16777215
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.boolean "audience", default: false, null: false
    t.integer "interest_id", default: 1, null: false
    t.index ["audience"], name: "index_series_on_audience"
    t.index ["interest_id"], name: "index_series_on_interest_id"
    t.index ["slug"], name: "index_series_on_slug"
    t.index ["type", "id"], name: "index_series_on_type_and_id"
    t.index ["type"], name: "index_series_on_type"
  end

  create_table "series_works", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "series_id", null: false
    t.integer "work_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "titles", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.integer "sort"
    t.integer "interest_id", default: 1, null: false
    t.index ["interest_id", "sort"], name: "index_titles_on_interest_id_and_sort"
    t.index ["interest_id"], name: "index_titles_on_interest_id"
    t.index ["name"], name: "index_titles_on_name"
    t.index ["slug"], name: "index_titles_on_slug"
    t.index ["sort"], name: "index_titles_on_sort"
  end

  create_table "tools", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.string "type", limit: 16, null: false
    t.boolean "front_end", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "fluency", limit: 1, default: 0, null: false
    t.string "slug"
    t.integer "sort"
    t.boolean "resume", default: false
    t.integer "interest_id", default: 1, null: false
    t.index ["fluency"], name: "index_tools_on_fluency"
    t.index ["interest_id", "sort"], name: "index_tools_on_interest_id_and_sort"
    t.index ["interest_id"], name: "index_tools_on_interest_id"
    t.index ["name"], name: "index_tools_on_name"
    t.index ["slug"], name: "index_tools_on_slug"
    t.index ["sort"], name: "index_tools_on_sort"
    t.index ["type", "sort"], name: "index_tools_on_type_and_category_and_sort", unique: true
    t.index ["type"], name: "index_tools_on_type"
  end

  create_table "users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "one_liner"
    t.text "objective"
    t.text "summary"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "variants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "work_id", null: false
    t.string "name", null: false
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["work_id"], name: "index_variants_on_work_id"
    t.index ["year"], name: "index_variants_on_year"
  end

  create_table "wields", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "work_id", null: false
    t.integer "tool_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "legacy", default: false, null: false
    t.index ["tool_id"], name: "index_wields_on_tool_id"
    t.index ["work_id"], name: "index_wields_on_work_id"
  end

  create_table "works", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.integer "interest_id", null: false
    t.string "type", limit: 16, default: "App", null: false
    t.integer "party_id", null: false
    t.string "url"
    t.integer "start_year", null: false
    t.integer "stop_year"
    t.text "description", limit: 16777215
    t.string "summary"
    t.boolean "live", default: true, null: false
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", limit: 16, default: "pre", null: false
    t.string "status_message"
    t.string "location"
    t.boolean "demo", default: false, null: false
    t.boolean "favorite", default: false, null: false
    t.integer "author_id", default: 1, null: false
    t.integer "soundcloud_id"
    t.integer "genre_id"
    t.integer "place_id"
    t.string "instagram_id"
    t.bigint "flickr_id"
    t.integer "key_id"
    t.index ["author_id"], name: "index_works_on_author_id"
    t.index ["favorite"], name: "index_works_on_favorite"
    t.index ["flickr_id"], name: "index_works_on_flickr_id"
    t.index ["genre_id"], name: "index_works_on_genre_id"
    t.index ["instagram_id"], name: "index_works_on_instagram_id"
    t.index ["interest_id"], name: "index_works_on_interest_id"
    t.index ["key_id"], name: "index_works_on_key_id"
    t.index ["live"], name: "index_works_on_live"
    t.index ["party_id"], name: "index_works_on_party_id"
    t.index ["slug"], name: "index_works_on_slug"
    t.index ["soundcloud_id"], name: "index_works_on_soundcloud_id"
    t.index ["start_year"], name: "index_works_on_start_year"
    t.index ["status"], name: "index_works_on_status"
    t.index ["stop_year"], name: "index_works_on_stop_year"
    t.index ["type", "id"], name: "index_works_on_type_and_id"
    t.index ["type"], name: "index_works_on_type"
  end

end
