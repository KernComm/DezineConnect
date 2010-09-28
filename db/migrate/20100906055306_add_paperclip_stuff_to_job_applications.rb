class AddPaperclipStuffToJobApplications < ActiveRecord::Migration
  def self.up
    add_column :job_applications, :resume_file_name, :string
    add_column :job_applications, :resume_content_type, :string
    add_column :job_applications, :resume_file_size, :integer
    add_column :job_applications, :portfolio_file_name, :string
    add_column :job_applications, :portfolio_content_type, :string
    add_column :job_applications, :portfolio_file_size, :integer
  end

  def self.down
    remove_column :job_applications, :resume_file_name
    remove_column :job_applications, :resume_content_type
    remove_column :job_applications, :resume_file_size
    remove_column :job_applications, :portfolio_file_name
    remove_column :job_applications, :portfolio_content_type
    remove_column :job_applications, :portfolio_file_size
  end
end
