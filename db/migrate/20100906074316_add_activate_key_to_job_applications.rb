class AddActivateKeyToJobApplications < ActiveRecord::Migration
  def self.up
    add_column :job_applications, :activation_key, :text
  end

  def self.down
    remove_column :job_applications, :activation_key
  end
end
