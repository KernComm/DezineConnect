class AddActivationkeyToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :activation_key, :text
  end

  def self.down
    remove_column :jobs, :activation_key
  end
end
