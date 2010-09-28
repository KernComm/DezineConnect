class AddFirstnameAndLastnametoPortfolio < ActiveRecord::Migration
  def self.up
    add_column :portfolios, :user_firstname, :string
    add_column :portfolios, :user_lastname, :string
  end

  def self.down
    remove_column :portfolios, :user_firstname
    remove_column :portfolios, :user_lastname
  end
end
