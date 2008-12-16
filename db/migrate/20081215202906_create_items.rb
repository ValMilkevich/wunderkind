class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.integer :category_id
      t.integer :folder_id
      t.integer :author_id
      t.string :subj
      t.text :body
      t.text :description
      t.string :location

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
