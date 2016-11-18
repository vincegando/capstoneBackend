class AddRouterToResidence < ActiveRecord::Migration
  def change
    add_column :residences, :router, :mash_many
  end
end
