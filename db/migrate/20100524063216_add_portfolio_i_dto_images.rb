class AddPortfolioIDtoImages < ActiveRecord::Migration
  def self.up
    add_column :images, :portfolio_id, :integer
  end

  def self.down
    remove_column :images, :portfolio_id
  end
end
