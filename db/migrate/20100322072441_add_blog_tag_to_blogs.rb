class AddBlogTagToBlogs < ActiveRecord::Migration
  def self.up
    add_column :blogs, :tag, :text
  end

  def self.down
    remove_column :blogs, :tag
  end
end
