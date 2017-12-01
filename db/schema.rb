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

ActiveRecord::Schema.define(version: 20171130195337) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.string   "fa_icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activities_experiences", force: :cascade do |t|
    t.integer  "activity_id"
    t.integer  "experience_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["activity_id"], name: "index_activities_experiences_on_activity_id", using: :btree
    t.index ["experience_id"], name: "index_activities_experiences_on_experience_id", using: :btree
  end

  create_table "areatypes", force: :cascade do |t|
    t.string   "name"
    t.string   "fa_icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "areatypes_experiences", force: :cascade do |t|
    t.integer  "areatype_id"
    t.integer  "experience_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["areatype_id"], name: "index_areatypes_experiences_on_areatype_id", using: :btree
    t.index ["experience_id"], name: "index_areatypes_experiences_on_experience_id", using: :btree
  end

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "contributions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "fund_id"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "trip_id"
    t.index ["fund_id"], name: "index_contributions_on_fund_id", using: :btree
    t.index ["trip_id"], name: "index_contributions_on_trip_id", using: :btree
    t.index ["user_id"], name: "index_contributions_on_user_id", using: :btree
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "experiences", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.float    "price_cents"
    t.integer  "capacity"
    t.boolean  "status",            default: false
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "long_description"
    t.string   "short_description"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "city"
    t.string   "postal_code"
    t.string   "country"
    t.integer  "fund_id"
    t.index ["fund_id"], name: "index_experiences_on_fund_id", using: :btree
    t.index ["user_id"], name: "index_experiences_on_user_id", using: :btree
  end

  create_table "experiences_features", force: :cascade do |t|
    t.integer  "feature_id"
    t.integer  "experience_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["experience_id"], name: "index_experiences_features_on_experience_id", using: :btree
    t.index ["feature_id"], name: "index_experiences_features_on_feature_id", using: :btree
  end

  create_table "features", force: :cascade do |t|
    t.string   "name"
    t.string   "fa_icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funds", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "funding_goal"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "title"
    t.text     "about"
    t.text     "use_of_funds"
    t.index ["user_id"], name: "index_funds_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.string   "header"
    t.text     "content"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.boolean  "read",            default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.string   "state"
    t.string   "experience_sku"
    t.integer  "amount_cents",   default: 0, null: false
    t.jsonb    "payment"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "trip_id"
    t.index ["trip_id"], name: "index_orders_on_trip_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "content"
    t.integer  "experience_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "rating"
    t.index ["experience_id"], name: "index_reviews_on_experience_id", using: :btree
  end

  create_table "trips", force: :cascade do |t|
    t.integer  "experience_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "user_id"
    t.boolean  "status",        default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "cancel",        default: false
    t.index ["experience_id"], name: "index_trips_on_experience_id", using: :btree
    t.index ["user_id"], name: "index_trips_on_user_id", using: :btree
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
    t.boolean  "ngo"
    t.boolean  "admin"
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "activities_experiences", "activities"
  add_foreign_key "activities_experiences", "experiences"
  add_foreign_key "areatypes_experiences", "areatypes"
  add_foreign_key "areatypes_experiences", "experiences"
  add_foreign_key "contributions", "funds"
  add_foreign_key "contributions", "trips"
  add_foreign_key "contributions", "users"
  add_foreign_key "experiences", "users"
  add_foreign_key "experiences_features", "experiences"
  add_foreign_key "experiences_features", "features"
  add_foreign_key "funds", "users"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "reviews", "experiences"
  add_foreign_key "trips", "experiences"
  add_foreign_key "trips", "users"
end
