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

ActiveRecord::Schema.define(version: 20150421150654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bomcomponents", force: true do |t|
    t.string   "ref"
    t.string   "bom_id"
    t.string   "component_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bomitems", force: true do |t|
    t.string   "ref"
    t.integer  "bom_id"
    t.integer  "part_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bomitems", ["bom_id"], name: "index_bomitems_on_bom_id", using: :btree
  add_index "bomitems", ["part_id"], name: "index_bomitems_on_part_id", using: :btree

  create_table "boms", force: true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "buildstandards", force: true do |t|
    t.text     "description"
    t.integer  "spin_id"
    t.string   "bom"
    t.string   "schematic"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bom_id"
  end

  create_table "components", force: true do |t|
    t.string   "value"
    t.string   "package"
    t.string   "manufacturer"
    t.string   "manufacturer_part"
    t.string   "manufacturer_part_alt"
    t.string   "resmed_part"
    t.text     "description"
    t.string   "part_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "distributors", force: true do |t|
    t.string   "name"
    t.string   "url"
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

  create_table "manufacturers", force: true do |t|
    t.string   "name"
    t.string   "url"
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

  create_table "partcustoms", force: true do |t|
    t.string   "type"
    t.string   "package"
    t.string   "value"
    t.text     "partdata"
    t.text     "comment"
    t.string   "tenant_no"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "partdistibutorrelationships", force: true do |t|
    t.integer  "part_id"
    t.integer  "distributor_id"
    t.string   "distributor_part_no"
    t.string   "distributor_part_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "partdistibutorrelationships", ["distributor_id"], name: "index_partdistibutorrelationships_on_distributor_id", using: :btree
  add_index "partdistibutorrelationships", ["part_id"], name: "index_partdistibutorrelationships_on_part_id", using: :btree

  create_table "partelecs", force: true do |t|
    t.string   "type"
    t.string   "package"
    t.string   "value"
    t.text     "partdata"
    t.text     "comment"
    t.string   "tenant_no"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parts", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "partable_id"
    t.string   "partable_type"
    t.integer  "manufacturer_id"
    t.string   "manfacturer_part_no"
    t.string   "manufacturer_part_url"
    t.integer  "distributor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "parts", ["partable_id", "partable_type"], name: "index_parts_on_partable_id_and_partable_type", using: :btree

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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
