class AddHeatmapZoom < ActiveRecord::Migration
  def self.up
    add_column :heatmaps, :zoom, :float
  end

  def self.down
    remove_column :heatmaps, :zoom
  end
end
