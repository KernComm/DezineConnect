class AddUserIdToJobApplications < ActiveRecord::Migration
  def self.up
    add_column :job_applications, :user_id, :integer
  end

  def self.down
    remove_column :job_applications, :user_id
  end
end
