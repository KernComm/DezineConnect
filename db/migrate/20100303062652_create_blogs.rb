class CreateBlogs < ActiveRecord::Migration
  def self.up
    create_table :blogs do |t|
      t.text :name
      t.text :blog_statement
      t.text :blog_content
      t.timestamps
    end
  end

  def self.down
    drop_table :blogs
  end
end
