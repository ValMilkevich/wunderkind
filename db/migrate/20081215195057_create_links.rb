class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.integer :linkable_id
      t.integer :linkable_type
      t.string :source
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :links
  end
end
