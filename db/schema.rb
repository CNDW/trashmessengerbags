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

ActiveRecord::Schema.define(version: 20140221204652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

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
    t.decimal  "price",           precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_type_id"
    t.integer  "product_id"
    t.string   "category"
    t.hstore   "properties"
  end

  create_table "customizers", force: true do |t|
    t.integer  "customizable_id"
    t.string   "customizable_type"
    t.integer  "option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customizers", ["customizable_id", "customizable_type"], name: "index_customizers_on_customizable_id_and_customizable_type", using: :btree

  create_table "galleries", force: true do |t|
    t.string   "name"
    t.string   "desc"
    t.string   "title"
    t.boolean  "slideshow"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gallery_indices", force: true do |t|
    t.integer "gallery_indexable_id"
    t.string  "gallery_indexable_type"
    t.integer "gallery_id"
    t.integer "image_id"
  end

  add_index "gallery_indices", ["gallery_id"], name: "index_gallery_indices_on_gallery_id", using: :btree
  add_index "gallery_indices", ["gallery_indexable_id"], name: "index_gallery_indices_on_gallery_indexable_id", using: :btree
  add_index "gallery_indices", ["image_id"], name: "index_gallery_indices_on_image_id", using: :btree

  create_table "images", force: true do |t|
    t.string   "title"
    t.string   "desc"
    t.string   "image_data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "option_fields", force: true do |t|
    t.string   "name"
    t.string   "field_type"
    t.boolean  "required"
    t.integer  "option_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "option_fields", ["option_type_id"], name: "index_option_fields_on_option_type_id", using: :btree

  create_table "option_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "options", force: true do |t|
    t.integer  "option_type_id"
    t.string   "name"
    t.decimal  "price",          precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.hstore   "properties"
  end

  add_index "options", ["option_type_id"], name: "index_options_on_option_type_id", using: :btree

  create_table "product_fields", force: true do |t|
    t.string   "name"
    t.string   "field_type"
    t.boolean  "required"
    t.integer  "product_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_fields", ["product_type_id"], name: "index_product_fields_on_product_type_id", using: :btree

  create_table "product_types", force: true do |t|
    t.string   "name"
    t.decimal  "price",      precision: 8, scale: 2
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.decimal  "price",           precision: 8, scale: 2
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_type_id"
    t.hstore   "properties"
  end

  add_index "products", ["name"], name: "index_products_on_name", unique: true, using: :btree
  add_index "products", ["product_type_id"], name: "index_products_on_product_type_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password_hash"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "password_digest"
  end

end
