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

ActiveRecord::Schema.define(version: 20160826201135) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "street_number"
    t.string   "suite"
    t.string   "zip_code"
    t.string   "colony"
    t.string   "country"
    t.string   "city"
    t.string   "town"
    t.string   "federal_entity"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "categories", force: :cascade do |t|
    t.integer  "subcategory"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "name"
    t.string   "sku"
    t.float    "price"
    t.float    "weight"
    t.string   "min_order_quantity"
    t.string   "origin"
    t.string   "packaging"
    t.integer  "category_id"
    t.integer  "provider_id"
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
    t.index ["provider_id"], name: "index_products_on_provider_id", using: :btree
  end

  create_table "providers", force: :cascade do |t|
    t.string   "name"
    t.string   "lastName"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "address_id"
    t.integer  "telephone"
    t.string   "user_type"
    t.integer  "user_id"
    t.integer  "s3_asset_id"
    t.index ["address_id"], name: "index_providers_on_address_id", using: :btree
    t.index ["s3_asset_id"], name: "index_providers_on_s3_asset_id", using: :btree
    t.index ["user_id"], name: "index_providers_on_user_id", using: :btree
  end

  create_table "s3_assets", force: :cascade do |t|
    t.string   "url_file"
    t.string   "name_file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "provider_id"
    t.index ["provider_id"], name: "index_users_on_provider_id", using: :btree
  end

  add_foreign_key "products", "categories"
  add_foreign_key "products", "providers"
  add_foreign_key "providers", "addresses"
  add_foreign_key "providers", "s3_assets"
  add_foreign_key "providers", "users"
  add_foreign_key "users", "providers"
end
