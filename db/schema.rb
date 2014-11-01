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

ActiveRecord::Schema.define(version: 20141101101948) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bed_prices", force: true do |t|
    t.integer  "bed_id"
    t.boolean  "has_decoration",                          default: false
    t.boolean  "has_rack",                                default: false
    t.integer  "dimension_id"
    t.decimal  "price",          precision: 10, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bed_purchases", force: true do |t|
    t.string   "uid"
    t.integer  "bed_id"
    t.integer  "bed_price_id"
    t.integer  "color_id"
    t.decimal  "price",        precision: 10, scale: 2
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "notes"
    t.string   "state",                                 default: "new"
    t.string   "ip_address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
    t.string   "zip_code"
    t.string   "city"
    t.string   "country"
    t.integer  "kit_price_id"
    t.decimal  "price_kit",    precision: 10, scale: 2
    t.decimal  "price_bed",    precision: 10, scale: 2
  end

  create_table "beds", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "sequence"
    t.boolean  "has_decoration"
    t.boolean  "has_rack"
    t.text     "description_lv"
    t.text     "description_ru"
    t.text     "description_en"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colors", force: true do |t|
    t.integer  "itemable_id"
    t.string   "itemable_type"
    t.string   "name_lv"
    t.string   "name_en"
    t.string   "name_ru"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sequence",      default: 0
  end

  create_table "dimensions", force: true do |t|
    t.string   "name"
    t.integer  "itemable_id"
    t.string   "itemable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_default",    default: false
    t.string   "short_name"
    t.integer  "sequence",      default: 0
  end

  create_table "kit_prices", force: true do |t|
    t.integer  "bed_id"
    t.integer  "kit_id"
    t.integer  "dimension_id"
    t.decimal  "price",        precision: 10, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kits", force: true do |t|
    t.integer  "itemable_id"
    t.string   "itemable_type"
    t.string   "name_lv"
    t.string   "name_en"
    t.string   "name_ru"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_default",     default: false
    t.text     "description_lv"
    t.text     "description_en"
    t.text     "description_ru"
    t.integer  "sequence",       default: 0
  end

  create_table "linens", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "sequence"
    t.text     "description_lv"
    t.text     "description_ru"
    t.text     "description_en"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "thumbs", force: true do |t|
    t.integer  "thumbable_id"
    t.string   "thumbable_type"
    t.string   "file"
    t.integer  "sequence"
    t.text     "description"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_default",     default: false
    t.boolean  "is_kit_image",   default: false
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
