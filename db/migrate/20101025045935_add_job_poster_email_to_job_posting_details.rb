class AddJobPosterEmailToJobPostingDetails < ActiveRecord::Migration
  def self.up
    add_column :job_posting_details, :job_poster_email, :text
  end

  def self.down
    remove_column :job_posting_details, :job_poster_email
  end
end
