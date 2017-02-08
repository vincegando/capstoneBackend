class HeatmapPoint < ActiveRecord::Base
	fields do
		latitude :decimal, precision: 20, scale: 15
		longitude :decimal, precision: 20, scale: 15
		client_info :string
		upstream_bps :float
		downstream_bps :float
		downstream_bps :float
		jitter :float
		client_rssi :float
		router_rssi :float
		num_active_clients :integer
		client_tx_speed :float
		client_rx_speed :float
		client_tx_retries :integer
		client_rx_retries :integer
		retransmits :integer
		lost_percent :float
    	timestamps
  	end
  	belongs_to :heatmap
end
