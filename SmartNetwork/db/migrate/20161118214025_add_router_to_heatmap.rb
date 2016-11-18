class AddRouterToHeatmap < ActiveRecord::Migration
  def change
    add_column :heatmaps, :router, :has_many
  end
end
