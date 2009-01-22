class RemoveImageColumnFromPosts < ActiveRecord::Migration
  def self.up
    remove_column(:posts, :image)
  end

  def self.down
    add_column(:posts, :image, :string)
  end
end
