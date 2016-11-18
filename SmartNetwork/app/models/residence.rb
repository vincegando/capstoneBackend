class Residence < ActiveRecord::Base


  	fields do
  		address :string
  		timestamps
  	end

  	has_many :routers
  	has_many :heatmaps

end
