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

ActiveRecord::Schema.define(version: 20140131074238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["remember_token"], name: "index_admins_on_remember_token", using: :btree

  create_table "custom_items", force: true do |t|
    t.string   "name"
    t.decimal  "price",               precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_category_id"
    t.integer  "product_type_id"
    t.integer  "product_model_id"
    t.integer  "product_id"
  end

  create_table "custom_items_product_options", id: false, force: true do |t|
    t.integer "custom_item_id"
    t.integer "product_option_id"
  end

  create_table "images", force: true do |t|
    t.string   "title"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "desc"
    t.string   "image_data"
    t.integer  "gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "options_products", id: false, force: true do |t|
    t.integer "product_option_id"
    t.integer "product_id"
  end

  create_table "product_categories", force: true do |t|
    t.string   "name"
    t.decimal  "price",      precision: 8, scale: 2
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
  end

  create_table "product_options", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "desc"
    t.decimal  "price",      precision: 8, scale: 2
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.decimal  "price",               precision: 8, scale: 2
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_category_id"
  end

  add_index "products", ["name"], name: "index_products_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password_hash"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "password_digest"
  end

end
