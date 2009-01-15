class AddCategoryIdToTags < ActiveRecord::Migration
  def self.up
    add_column :tags, :category_id, :integer
  end

  def self.down
    remove_column :tags, :category_id
  end
end
