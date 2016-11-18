class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :residences do |t|
      t.string   :address
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :residences
  end
end
