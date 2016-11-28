class RouterFloatToDecimal < ActiveRecord::Migration
  def self.up
    change_column :routers, :latitude, :decimal, :limit => nil
    change_column :routers, :longitude, :decimal, :limit => nil
  end

  def self.down
    change_column :routers, :latitude, :float, limit: 24
    change_column :routers, :longitude, :float, limit: 24
  end
end
