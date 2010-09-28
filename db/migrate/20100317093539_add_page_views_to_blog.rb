class AddPageViewsToBlog < ActiveRecord::Migration
 def self.up
   add_column :blogs, :page_views, :text
 end

 def self.down
   remove_column :blogs, :page_views
 end
end
