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

ActiveRecord::Schema.define(version: 20140124181912) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "custom_items", force: true do |t|
    t.string   "name"
    t.decimal  "price",               precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_category_id"
    t.integer  "product_type_id"
    t.integer  "product_model_id"
  end

  create_table "custom_items_product_options", id: false, force: true do |t|
    t.integer "custom_item_id"
    t.integer "product_option_id"
  end

  create_table "product_categories", force: true do |t|
    t.string   "name"
    t.decimal  "price",      precision: 8, scale: 2
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_models", force: true do |t|
    t.string   "name"
    t.decimal  "price",           precision: 8, scale: 2
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_type_id"
  end

  create_table "product_models_options", id: false, force: true do |t|
    t.integer "product_model_id"
    t.integer "product_option_id"
  end

  create_table "product_options", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_types", force: true do |t|
    t.string   "name"
    t.decimal  "price",               precision: 8, scale: 2
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_category_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password_hash"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "password_digest"
  end

end
