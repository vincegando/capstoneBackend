class AddHeatmapToResidence < ActiveRecord::Migration
  def change
    add_column :residences, :heatmap, :has_many
  end
end
