class AddColumnsToDesignDirectories < ActiveRecord::Migration
  def self.up
    add_column :design_directories, :display_name, :text
    add_column :design_directories, :key_service, :text
    add_column :design_directories, :other_service1, :text
    add_column :design_directories, :other_service2, :text
    add_column :design_directories, :other_service3, :text
    add_column :design_directories, :clients1, :text
    add_column :design_directories, :clients2, :text
    add_column :design_directories, :clients3, :text
  end

  def self.down
    remove_column :design_directories, :display_name
    remove_column :design_directories, :key_service
    remove_column :design_directories, :other_service1
    remove_column :design_directories, :other_service2
    remove_column :design_directories, :other_service3
    remove_column :design_directories, :clients1
    remove_column :design_directories, :clients2
    remove_column :design_directories, :clients3
  end
end
