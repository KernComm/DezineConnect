class AddContactEmailToDesignDirectory < ActiveRecord::Migration
  def self.up
    add_column :design_directories, :contact_email, :text
  end

  def self.down
    remove_column :design_directories, :contact_email
  end
end
