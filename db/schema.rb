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

ActiveRecord::Schema.define(version: 20171025230628) do

  create_table "incicent_replacements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "description", limit: 65535
    t.integer  "amount"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "incident_replacements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "description",    limit: 65535
    t.integer  "amount"
    t.integer  "incident_id"
    t.integer  "replacement_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["incident_id"], name: "index_incident_replacements_on_incident_id", using: :btree
    t.index ["replacement_id"], name: "index_incident_replacements_on_replacement_id", using: :btree
  end

  create_table "incidents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "client_number"
    t.string   "incident_type"
    t.text     "description",   limit: 65535
    t.string   "state"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "replacements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "amount"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "incident_id"
    t.index ["incident_id"], name: "index_replacements_on_incident_id", using: :btree
  end

end
