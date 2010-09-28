class CreateDesignDirectories < ActiveRecord::Migration
  def self.up
    create_table :design_directories do |t|
      t.string :company_name
      t.text :company_overview
      t.text :services
      t.string :staff_size
      t.string :year_founded
      t.string :custom_url
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :facebook
      t.string :twitter
      t.string :linkedin
      t.string :website

      t.timestamps
    end
  end

  def self.down
    drop_table :design_directories
  end
end
