class CreateJobApplications < ActiveRecord::Migration
  def self.up
    create_table :job_applications do |t|
      t.text :Name
      t.text :email
      t.text :specialization
      t.text :cover_letter
      t.text :resume_link
      t.text :portfolio_link
      t.timestamps
    end
  end

  def self.down
    drop_table :job_applications
  end
end
