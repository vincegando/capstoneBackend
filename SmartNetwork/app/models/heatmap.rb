class Heatmap < ActiveRecord::Base
	fields do
    	channel :string
    	radio  :string
    	timestamps
  	end
  	has_many :routers
  	has_many :heatmap_points
  	belongs_to :residence
end
