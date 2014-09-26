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

ActiveRecord::Schema.define(version: 20140916165817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildstandards", force: true do |t|
    t.text     "description"
    t.integer  "spin_id"
    t.string   "bom"
    t.string   "schematic"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.integer  "spin_id"
    t.string   "name"
    t.string   "image_url"
    t.integer  "user_id"
    t.string   "barcodeimage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mods", force: true do |t|
    t.integer  "item_id"
    t.text     "name"
    t.text     "description"
    t.integer  "build_rev"
    t.integer  "buildstandard_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "product_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spins", force: true do |t|
    t.integer  "product_id"
    t.integer  "item_count"
    t.text     "description"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
