class Residence < ActiveRecord::Base

  	fields do
  		address :string
  		timestamps
  	end
end
