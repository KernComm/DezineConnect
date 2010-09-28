class AddContentForHomePagetoBlogs < ActiveRecord::Migration
  def self.up
    add_column :blogs, :content_for_home_page, :text
  end

  def self.down
    remove_column :blogs, :content_for_home_page
  end
end
