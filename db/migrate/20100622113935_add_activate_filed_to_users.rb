class AddActivateFiledToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :activate, :boolean, :default => 0
  end

  def self.down
    remove_column :users, :activate
  end
end
