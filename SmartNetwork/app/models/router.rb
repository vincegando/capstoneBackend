class Router < ActiveRecord::Base
	fields do
		mac_address :string
		serial_number :string
		router_model :string
		name :string
		latitude :decimal, precision: 20, scale: 15
		longitude :decimal, precision: 20, scale: 15
		owner :string
		timestamps
	end
	belongs_to :residence
	has_and_belongs_to_many :heatmaps
end
