class AddActivationKeyToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :activation_key, :text
  end

  def self.down
    remove_column :users, :activation_key
  end
end
