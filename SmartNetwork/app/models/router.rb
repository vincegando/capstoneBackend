class Router < ActiveRecord::Base
	fields do
		mac_address :string
		serial_number :string
		router_model :string
		name :string
		latitude :float
		longitude :float
		owner :string
		timestamps
	end
end
