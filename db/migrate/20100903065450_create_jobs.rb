class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.text :job_title
      t.text :company_name
      t.text :location
      t.text :job_description
      t.text :how_to_apply_email
     
      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
