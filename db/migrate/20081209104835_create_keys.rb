class CreateKeys < ActiveRecord::Migration
  def self.up
    create_table :keys do |t|
      t.string :name
      t.integer :parent_id
      t.boolean :namespace, :default => false
      t.boolean :sequence, :default => false
      t.boolean :is_string, :default => false
      
      t.timestamps
    end
  end

  def self.down
    drop_table :keys
  end
end
