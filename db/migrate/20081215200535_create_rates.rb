class CreateRates < ActiveRecord::Migration
  def self.up
    create_table :rates do |t|
      t.integer :ratable_id
      t.string :ratable_type
      t.integer :value
      t.string :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :rates
  end
end
