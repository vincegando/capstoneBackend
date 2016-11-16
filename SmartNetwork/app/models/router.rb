class Router
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Geospatial

  belongs_to :residence, inverse_of: :routers
  has_and_belongs_to_many :maps, inverse_of: :routers, index: true

  field :loc, type: Point
  field :MAC, type: String
  field :name, type: String
  field :serial, type: String

  spatial_index :loc

end
