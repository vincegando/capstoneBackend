class CreateJoinTableHeatmapRouter < ActiveRecord::Migration
  def change
    create_join_table :heatmaps, :routers do |t|
      t.index [:heatmap_id, :router_id]
      t.index [:router_id, :heatmap_id]
    end
  end
end
