class Router < ActiveRecord::Base
	fields do
		mac_address :string
		serial_number :string
		router_model :string
		name :string
		latitude :decimal
		longitude :decimal
		owner :string
		timestamps
	end
	belongs_to :residence
	belongs_to :heatmap
end
