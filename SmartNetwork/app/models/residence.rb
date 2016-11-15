class Residence
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Geospatial

  has_many :maps, inverse_of: :residence
  has_many :routers, inverse_of: :residence

  field :address, type: String
  field :resident, type: String

end
