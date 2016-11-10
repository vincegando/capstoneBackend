class CreateRouter < ActiveRecord::Migration
  def self.up
    create_table :routers do |t|
      t.string   :mac_address
      t.string   :serial_number
      t.string   :router_model
      t.string   :name
      t.float    :latitude
      t.float    :longitude
      t.string   :owner
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :routers
  end
end
