class Map
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Geospatial

  belongs_to :residence, inverse_of: :maps
  has_and_belongs_to_many :routers, inverse_of: :maps, index: true
  embeds_many :pins
  
  field :name, type: String

  spatial_index "pins.loc"

end
