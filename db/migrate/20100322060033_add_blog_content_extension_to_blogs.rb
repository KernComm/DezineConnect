class AddBlogContentExtensionToBlogs < ActiveRecord::Migration
  def self.up
    add_column :blogs, :extended_content, :text
  end

  def self.down
    remove_column :blogs, :extended_content
  end
end
