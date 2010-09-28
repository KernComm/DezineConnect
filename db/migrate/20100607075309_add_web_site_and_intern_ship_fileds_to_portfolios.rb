class AddWebSiteAndInternShipFiledsToPortfolios < ActiveRecord::Migration
  def self.up
    add_column :portfolios, :availability_5, :string
    add_column :portfolios, :website, :string
  end

  def self.down
    remove_column :portfolios, :availability_5
    remove_column :portfolios, :website
  end
end
