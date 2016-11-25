class AddRequiredTablesAndRelationships < ActiveRecord::Migration
  def self.up
    create_table :heatmaps do |t|
      t.string   :channel
      t.string   :radio
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :residence_id
    end
    add_index :heatmaps, [:residence_id]

    create_table :heatmap_points do |t|
      t.float    :latitude
      t.float    :longitude
      t.string   :client_info
      t.float    :upstream_bps
      t.float    :jitter
      t.float    :downstream_bps
      t.float    :client_rssi
      t.float    :router_rssi
      t.integer  :num_active_clients
      t.float    :client_tx_speed
      t.float    :client_rx_speed
      t.integer  :client_tx_retries
      t.integer  :client_rx_retries
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :heatmap_id
    end
    add_index :heatmap_points, [:heatmap_id]

    create_table :residences do |t|
      t.string   :address
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :routers do |t|
      t.string   :mac_address
      t.string   :serial_number
      t.string   :router_model
      t.string   :name
      t.float    :latitude
      t.float    :longitude
      t.string   :owner
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :residence_id
      t.integer  :heatmap_id
    end
    add_index :routers, [:residence_id]
    add_index :routers, [:heatmap_id]
  end

  def self.down
    drop_table :heatmaps
    drop_table :heatmap_points
    drop_table :residences
    drop_table :routers
  end
end
