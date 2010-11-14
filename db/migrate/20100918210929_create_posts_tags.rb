class CreatePostsTags < ActiveRecord::Migration
  def self.up
    create_table :blog_posts_tags, {:id => false} do |t|
      t.references :blog_posts
      t.references :tags
    end
  end

  def self.down
    drop_table :blog_posts_tags
  end
end
