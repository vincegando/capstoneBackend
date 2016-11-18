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

ActiveRecord::Schema.define(version: 20161118214132) do

  create_table "heatmap_points", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "client_info"
    t.float    "upstream_bps"
    t.float    "downstream_bps"
    t.float    "jitter"
    t.float    "client_rssi"
    t.float    "router_rssi"
    t.integer  "num_active_clients"
    t.float    "client_tx_speed"
    t.float    "client_rx_speed"
    t.integer  "client_tx_retries"
    t.integer  "client_rx_retries"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

# Could not dump table "heatmaps" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

# Could not dump table "residences" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "routers", force: :cascade do |t|
    t.string   "mac_address"
    t.string   "serial_number"
    t.string   "router_model"
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "owner"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
