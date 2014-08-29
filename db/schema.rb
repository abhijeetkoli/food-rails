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

ActiveRecord::Schema.define(version: 20140822144917) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "api_keys", force: true do |t|
    t.string   "access_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "data_sources", id: false, force: true do |t|
    t.integer  "id"
    t.integer  "nutrient_no"
    t.string   "source_id"
    t.integer  "food_id"
    t.integer  "nutrient_id"
    t.string   "authors"
    t.string   "title"
    t.string   "year"
    t.string   "journal"
    t.string   "volume_city"
    t.string   "issue_state"
    t.string   "start_page"
    t.string   "end_page"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "derivation_codes", id: false, force: true do |t|
    t.integer  "id"
    t.string   "code"
    t.string   "description", limit: 1000
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: true do |t|
    t.string   "token"
    t.boolean  "enabled"
    t.string   "platform"
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "devices", ["company_id"], name: "index_devices_on_company_id", using: :btree
  add_index "devices", ["user_id"], name: "index_devices_on_user_id", using: :btree

  create_table "food_data_sources", id: false, force: true do |t|
    t.integer  "id"
    t.string   "ndb_no"
    t.string   "nutrient_no"
    t.integer  "data_source_id"
    t.integer  "food_id"
    t.integer  "nutrient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "food_data_sources", ["data_source_id"], name: "index_food_data_sources_on_data_source_id", using: :btree
  add_index "food_data_sources", ["food_id"], name: "index_food_data_sources_on_food_id", using: :btree
  add_index "food_data_sources", ["nutrient_id"], name: "index_food_data_sources_on_nutrient_id", using: :btree

  create_table "food_groups", id: false, force: true do |t|
    t.integer "id"
    t.string  "description"
  end

  create_table "food_nutrients", id: false, force: true do |t|
    t.integer  "id"
    t.string   "ndb_no"
    t.string   "nutrient_no"
    t.decimal  "value",                precision: 10, scale: 3
    t.integer  "data_points"
    t.decimal  "standard_error",       precision: 8,  scale: 3
    t.string   "reference_ndb_no"
    t.string   "added_nutrient_mark"
    t.integer  "studies"
    t.decimal  "minimum_value",        precision: 10, scale: 3
    t.decimal  "maximum_value",        precision: 10, scale: 3
    t.integer  "df"
    t.decimal  "lower_eb",             precision: 10, scale: 3
    t.decimal  "upper_eb",             precision: 10, scale: 3
    t.string   "statistical_comments"
    t.string   "confidence_code"
    t.string   "source_code"
    t.string   "derivation_code"
    t.integer  "food_id"
    t.integer  "nutrient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "food_nutrients", ["food_id"], name: "index_food_nutrients_on_food_id", using: :btree
  add_index "food_nutrients", ["nutrient_id"], name: "index_food_nutrients_on_nutrient_id", using: :btree

  create_table "food_sources", id: false, force: true do |t|
    t.integer  "id"
    t.integer  "source_id"
    t.text     "authors"
    t.string   "title"
    t.string   "year"
    t.string   "journal"
    t.string   "volume_city"
    t.string   "issue_state"
    t.string   "start_page"
    t.string   "end_page"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foods", id: false, force: true do |t|
    t.integer "id"
    t.string  "ndb_no"
    t.string  "food_group_code"
    t.string  "long_description"
    t.string  "short_description"
    t.string  "common_name"
    t.string  "company_name"
    t.string  "survey"
    t.string  "refuse_description"
    t.decimal "refuce",             precision: 10, scale: 0
    t.string  "scientific_name"
    t.decimal "nitrogen_factor",    precision: 4,  scale: 2
    t.decimal "protein_factor",     precision: 4,  scale: 2
    t.decimal "fat_factor",         precision: 4,  scale: 2
    t.decimal "cho_factor",         precision: 4,  scale: 2
    t.integer "food_group_id"
  end

  add_index "foods", ["food_group_id"], name: "index_foods_on_food_group_id", using: :btree

  create_table "nutrients", id: false, force: true do |t|
    t.integer  "id"
    t.string   "nutrient_no"
    t.string   "units"
    t.string   "tag_name"
    t.string   "descritpion"
    t.string   "decimal_places"
    t.integer  "sr_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "source_codes", id: false, force: true do |t|
    t.integer  "id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "authentication_token"
    t.string   "username",               default: "", null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone",                  default: "", null: false
    t.datetime "renew_on"
    t.string   "picture_url"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["phone"], name: "index_users_on_phone", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "weights", id: false, force: true do |t|
    t.integer  "id"
    t.string   "ndb_no"
    t.string   "sequence"
    t.decimal  "amount",             precision: 5, scale: 3
    t.string   "description"
    t.decimal  "gram_weight",        precision: 7, scale: 1
    t.integer  "data_points"
    t.decimal  "standard_deviation", precision: 7, scale: 3
    t.integer  "food_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "weights", ["food_id"], name: "index_weights_on_food_id", using: :btree

end
