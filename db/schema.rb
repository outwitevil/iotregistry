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

ActiveRecord::Schema.define(version: 20161006192309) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "device_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "iotdevice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["iotdevice_id"], name: "index_device_categories_on_iotdevice_id", using: :btree
  end

  create_table "firmwares", force: :cascade do |t|
    t.integer  "iotdevice_id"
    t.string   "download_url"
    t.string   "version"
    t.string   "name"
    t.string   "readme_url"
    t.string   "readme_title"
    t.text     "readme_description"
    t.boolean  "enabled"
    t.string   "requirements"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["iotdevice_id"], name: "index_firmwares_on_iotdevice_id", using: :btree
  end

  create_table "iotdevices", force: :cascade do |t|
    t.integer  "manufacturer_id"
    t.integer  "user_id"
    t.string   "product_url"
    t.string   "updates_url"
    t.string   "base_version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "manual_url"
    t.string   "manual_title"
    t.string   "manual_file_type"
    t.index ["manufacturer_id"], name: "index_iotdevices_on_manufacturer_id", using: :btree
    t.index ["user_id"], name: "index_iotdevices_on_user_id", using: :btree
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string   "name"
    t.string   "base_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "my_iot_devices", force: :cascade do |t|
    t.integer  "iotdevice_id"
    t.integer  "user_id"
    t.string   "ipv4_address"
    t.string   "installed_firmware_version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["iotdevice_id"], name: "index_my_iot_devices_on_iotdevice_id", using: :btree
    t.index ["user_id"], name: "index_my_iot_devices_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "body"
    t.string   "title"
    t.integer  "iotdevice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["iotdevice_id"], name: "index_reviews_on_iotdevice_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "username"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree
  end

end
