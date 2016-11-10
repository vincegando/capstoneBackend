class CreateHeatmap < ActiveRecord::Migration
  def self.up
    create_table :heatmaps do |t|
      t.string   :channel
      t.string   :radio
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :heatmaps
  end
end
