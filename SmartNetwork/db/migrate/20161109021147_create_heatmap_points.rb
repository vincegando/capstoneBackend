class CreateHeatmapPoints < ActiveRecord::Migration
  def self.up
    create_table :heatmap_points do |t|
      t.float    :latitude
      t.float    :longitude
      t.string   :client_info
      t.float    :upstream_bps
      t.float    :downstream_bps
      t.float    :jitter
      t.float    :client_rssi
      t.float    :router_rssi
      t.integer  :num_active_clients
      t.float    :client_tx_speed
      t.float    :client_rx_speed
      t.integer  :client_tx_retries
      t.integer  :client_rx_retries
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :heatmap_points
  end
end
