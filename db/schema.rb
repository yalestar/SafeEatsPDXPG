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

ActiveRecord::Schema.define(version: 20140505042629) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inspections", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", force: true do |t|
    t.string   "name",                   null: false
    t.string   "street"
    t.string   "city"
    t.string   "county"
    t.string   "zipcode"
    t.string   "site_id"
    t.string   "website"
    t.string   "latlon",     limit: nil, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "violations", force: true do |t|
    t.integer  "inspection_id"
    t.text     "violation_text"
    t.decimal  "point_decution", precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
