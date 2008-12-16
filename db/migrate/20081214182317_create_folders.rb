class CreateFolders < ActiveRecord::Migration
  def self.up
    create_table :folders do |t|
      t.integer :parent_id
      t.integer :category_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :folders
  end
end
