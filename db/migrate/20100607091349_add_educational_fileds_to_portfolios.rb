class AddEducationalFiledsToPortfolios < ActiveRecord::Migration
  def self.up
    add_column :portfolios, :education_1, :string
    add_column :portfolios, :education_2, :string
  end

  def self.down
    remove_column :portfolios, :education_1
    remove_column :portfolios, :education_2
  end
end
