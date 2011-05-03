class AddBelowSliderContentSections < ActiveRecord::Migration
  def self.up
    add_column :blogs, :below_slider_content_1, :text
    add_column :blogs, :below_slider_content_2, :text
    add_column :blogs, :below_slider_content_3, :text
    add_column :blogs, :below_slider_content_4, :text
  end

  def self.down
    remove_column :blogs, :below_slider_content_1
    remove_column :blogs, :below_slider_content_2
    remove_column :blogs, :below_slider_content_3
    remove_column :blogs, :below_slider_content_4

  end
end
