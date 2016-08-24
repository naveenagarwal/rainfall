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

ActiveRecord::Schema.define(version: 20160725063447) do

  create_table "rain_data", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "year"
    t.float    "jan",        limit: 24
    t.float    "feb",        limit: 24
    t.float    "mar",        limit: 24
    t.float    "apr",        limit: 24
    t.float    "may",        limit: 24
    t.float    "jun",        limit: 24
    t.float    "jul",        limit: 24
    t.float    "aug",        limit: 24
    t.float    "sep",        limit: 24
    t.float    "oct",        limit: 24
    t.float    "nov",        limit: 24
    t.float    "dec",        limit: 24
    t.float    "annual",     limit: 24
    t.float    "jan_feb",    limit: 24
    t.float    "mar_may",    limit: 24
    t.float    "jun_sep",    limit: 24
    t.float    "oct_dec",    limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["name"], name: "index_rain_data_on_name", using: :btree
    t.index ["year"], name: "index_rain_data_on_year", using: :btree
  end

end
