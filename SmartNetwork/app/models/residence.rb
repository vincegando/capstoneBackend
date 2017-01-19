class Residence < ActiveRecord::Base

	scope :with_address, -> (address) { where("address like ?", "#{address}%")}

  	fields do
  		address :string
  		timestamps
  	endd

  	has_many :routers
  	has_many :heatmaps
end
