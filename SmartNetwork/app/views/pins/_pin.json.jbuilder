json.extract! pin, :id, :loc, :host, :time, :bps_sent, :bps_received, :jitter_ms, :tx_rate, :rx_rate, :created_at, :updated_at
json.url map_pin_url(@map, pin, format: :json)