class AddJobIdtoJobPostingDetails < ActiveRecord::Migration
  def self.up
    add_column :job_posting_details, :job_id, :integer
  end

  def self.down
    remove_column :job_posting_details, :job_id
  end
end
