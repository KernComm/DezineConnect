class AddPhoneNumberToDesignDirectory < ActiveRecord::Migration
  def self.up
    add_column :design_directories, :phone_number, :text
  end

  def self.down
    remove_column :design_directories, :phone_number
  end
end
