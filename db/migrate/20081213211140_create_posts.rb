class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer   :author_id
      t.integer   :folder_id
      t.integer   :category_id
      t.integer   :status_id
      
      t.text      :review
      t.string    :subject
      t.text      :body
      t.string    :image
      
      t.integer   :comments_count, :default=>0
      t.integer   :views, :default=>0
      
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
