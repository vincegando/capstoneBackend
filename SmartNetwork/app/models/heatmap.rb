class Heatmap < ActiveRecord::Base
	fields do
    	channel :string
    	radio  :string
    	timestamps
  	end
  	has_and_belongs_to_many :routers
  	has_many :heatmap_points
  	belongs_to :residence
end
