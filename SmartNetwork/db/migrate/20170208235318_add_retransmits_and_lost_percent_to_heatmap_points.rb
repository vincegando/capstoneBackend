class AddRetransmitsAndLostPercentToHeatmapPoints < ActiveRecord::Migration
  def change
    add_column :heatmap_points, :retransmits, :integer
    add_column :heatmap_points, :lost_percent, :float
  end
end
