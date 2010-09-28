class AddJobIdToJobApplications < ActiveRecord::Migration
  def self.up
    add_column :job_applications, :job_id, :integer
  end

  def self.down
    remove_column :job_applications, :job_id
  end
end
