class Pin
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Geospatial

  embedded_in :map, inverse_of: :pins

  field :loc, type: Point
  field :host, type: String
  field :time, type: String
  field :bps_sent, type: Float
  field :bps_received, type: Float
  field :jitter_ms, type: Float
  field :tx_rate, type: Float
  field :rx_rate, type: Float

end
