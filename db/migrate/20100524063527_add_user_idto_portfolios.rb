class AddUserIdtoPortfolios < ActiveRecord::Migration
  def self.up
    add_column :portfolios, :user_id, :integer
  end

  def self.down
    remove_column :portfolios, :user_id
  end
end
