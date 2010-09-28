class AddProtfolioSpecsToPortfolio < ActiveRecord::Migration
  def self.up
    add_column :portfolios, :bio, :text
    add_column :portfolios, :profile_photo_file_name, :string
    add_column :portfolios, :profile_photo_content_type, :string
    add_column :portfolios, :profile_photo_file_size, :integer
    add_column :portfolios, :profile_photo_updated_at, :datetime
    add_column :portfolios, :featured_photo_file_name, :string
    add_column :portfolios, :featured_photo_content_type, :string
    add_column :portfolios, :featured_photo_file_size, :integer
    add_column :portfolios, :featured_photo_updated_at, :datetime
  end

  def self.down
    remove_column :portfolios, :bio
    remove_column :portfolios, :profile_photo_file_name
    remove_column :portfolios, :profile_photo_content_type
    remove_column :portfolios, :profile_photo_file_size
    remove_column :portfolios, :profile_photo_updated_at
    remove_column :portfolios, :featured_photo_file_name
    remove_column :portfolios, :featured_photo_content_type
    remove_column :portfolios, :featured_photo_file_size
    remove_column :portfolios, :featured_photo_updated_at
  end
end
