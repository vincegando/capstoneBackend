class Map
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Geospatial

  embeds_many :pins
  
  field :name, type: String

  spatial_index "pins.loc"
end
