class AddEmailToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :email, :text
  end

  def self.down
    remove_column :jobs, :email
  end
end
