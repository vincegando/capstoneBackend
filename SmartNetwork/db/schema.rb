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

ActiveRecord::Schema.define(version: 20161128230136) do

  create_table "heatmap_points", force: :cascade do |t|
    t.decimal  "latitude",                       precision: 20, scale: 15
    t.decimal  "longitude",                      precision: 20, scale: 15
    t.string   "client_info",        limit: 255
    t.float    "upstream_bps",       limit: 24
    t.float    "jitter",             limit: 24
    t.float    "downstream_bps",     limit: 24
    t.float    "client_rssi",        limit: 24
    t.float    "router_rssi",        limit: 24
    t.integer  "num_active_clients", limit: 4
    t.float    "client_tx_speed",    limit: 24
    t.float    "client_rx_speed",    limit: 24
    t.integer  "client_tx_retries",  limit: 4
    t.integer  "client_rx_retries",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "heatmap_id",         limit: 4
  end

  add_index "heatmap_points", ["heatmap_id"], name: "index_heatmap_points_on_heatmap_id", using: :btree

  create_table "heatmaps", force: :cascade do |t|
    t.string   "channel",      limit: 255
    t.string   "radio",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "residence_id", limit: 4
  end

  add_index "heatmaps", ["residence_id"], name: "index_heatmaps_on_residence_id", using: :btree

  create_table "residences", force: :cascade do |t|
    t.string   "address",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routers", force: :cascade do |t|
    t.string   "mac_address",   limit: 255
    t.string   "serial_number", limit: 255
    t.string   "router_model",  limit: 255
    t.string   "name",          limit: 255
    t.decimal  "latitude",                  precision: 20, scale: 15
    t.decimal  "longitude",                 precision: 20, scale: 15
    t.string   "owner",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "residence_id",  limit: 4
    t.integer  "heatmap_id",    limit: 4
  end

  add_index "routers", ["heatmap_id"], name: "index_routers_on_heatmap_id", using: :btree
  add_index "routers", ["residence_id"], name: "index_routers_on_residence_id", using: :btree

end
