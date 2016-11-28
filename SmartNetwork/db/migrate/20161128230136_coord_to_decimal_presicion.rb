class CoordToDecimalPresicion < ActiveRecord::Migration
  def self.up
    change_column :heatmap_points, :latitude, :decimal, :limit => nil, :precision => 20, :scale => 15
    change_column :heatmap_points, :longitude, :decimal, :limit => nil, :precision => 20, :scale => 15

    change_column :routers, :latitude, :decimal, :limit => nil, :precision => 20, :scale => 15
    change_column :routers, :longitude, :decimal, :limit => nil, :precision => 20, :scale => 15
  end

  def self.down
    change_column :heatmap_points, :latitude, :float, limit: 24
    change_column :heatmap_points, :longitude, :float, limit: 24

    change_column :routers, :latitude, :float, limit: 24
    change_column :routers, :longitude, :float, limit: 24
  end
end
