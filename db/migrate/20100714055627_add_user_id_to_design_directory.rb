class AddUserIdToDesignDirectory < ActiveRecord::Migration
  def self.up
    add_column :design_directories, :user_id, :string
  end

  def self.down
    remove_column :design_directories, :user_id
  end
end
