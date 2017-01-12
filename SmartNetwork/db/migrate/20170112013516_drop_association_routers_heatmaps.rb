class DropAssociationRoutersHeatmaps < ActiveRecord::Migration
  def self.up
    remove_column :routers, :heatmap_id

    remove_index :routers, :name => :index_routers_on_heatmap_id rescue ActiveRecord::StatementInvalid
  end

  def self.down
    add_column :routers, :heatmap_id, :integer, limit: 4

    add_index :routers, [:heatmap_id]
  end
end
