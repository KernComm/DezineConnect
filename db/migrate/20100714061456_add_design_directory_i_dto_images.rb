class AddDesignDirectoryIDtoImages < ActiveRecord::Migration
  def self.up
    add_column :images, :design_directory_id, :string
  end

  def self.down
    remove_column :images, :design_directory_id
  end
end
