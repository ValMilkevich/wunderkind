class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.integer :author_id
      t.integer :category_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
