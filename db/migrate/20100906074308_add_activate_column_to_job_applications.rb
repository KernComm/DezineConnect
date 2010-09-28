class AddActivateColumnToJobApplications < ActiveRecord::Migration
  def self.up
    add_column :job_applications, :activate, :boolean, :default => 0
  end

  def self.down
    remove_column :job_applications, :activate
  end
end
