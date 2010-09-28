class AddDescriptionAndSetNametoImages < ActiveRecord::Migration
  def self.up
    add_column :images, :description, :text
    add_column :images, :set_name, :string
  end

  def self.down
    remove_column :images, :description
    remove_column :images, :set_name
  end
end
