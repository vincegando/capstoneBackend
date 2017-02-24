class AddAccountNumber < ActiveRecord::Migration
  def self.up
    add_column :residences, :account_number, :string
  end

  def self.down
    remove_column :residences, :account_number
  end
end
