class AddActivateColumnToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :activate, :boolean, :default => 0
  end

  def self.down
    remove_column :jobs, :activate
  end
end
