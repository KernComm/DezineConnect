class CreateJobPostingDetails < ActiveRecord::Migration
  def self.up
    create_table :job_posting_details do |t|
      t.text :job_poster
      t.text :job_source
      t.text :job_source_text
      t.timestamps
    end
  end

  def self.down
    drop_table :job_posting_details
  end
end
