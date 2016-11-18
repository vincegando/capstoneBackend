class AddHeatmapPointToHeatmap < ActiveRecord::Migration
  def change
    add_column :heatmaps, :heatmap_point, :has_many
  end
end
