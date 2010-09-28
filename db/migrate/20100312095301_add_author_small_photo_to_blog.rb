class AddAuthorSmallPhotoToBlog < ActiveRecord::Migration
  def self.up
    add_column :blogs, :author_photo_small_file_name, :string
    add_column :blogs, :author_photo_small_content_type, :string
    add_column :blogs, :author_photo_small_file_size, :integer
    add_column :blogs, :author_photo_small_updated_at, :datetime
  end

  def self.down
    remove_column :blogs, :author_photo_small_file_name
    remove_column :blogs, :author_photo_small_content_type
    remove_column :blogs, :author_photo_small_file_size
    remove_column :blogs, :author_photo_small_updated_at
  end
end
