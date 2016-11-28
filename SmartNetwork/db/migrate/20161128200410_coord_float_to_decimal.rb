class CoordFloatToDecimal < ActiveRecord::Migration
  def self.up
    change_column :heatmap_points, :latitude, :decimal, :limit => nil
    change_column :heatmap_points, :longitude, :decimal, :limit => nil

    change_column :routers, :latitude, :decimal
    change_column :routers, :longitude, :decimal
  end

  def self.down
    change_column :heatmap_points, :latitude, :float, limit: 24
    change_column :heatmap_points, :longitude, :float, limit: 24

    change_column :routers, :latitude, :decimal, precision: 20, scale: 15
    change_column :routers, :longitude, :decimal, precision: 20, scale: 15
  end
end
