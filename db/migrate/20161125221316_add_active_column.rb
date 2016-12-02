class AddActiveColumn < ActiveRecord::Migration
  def change
  end
  def self.up
  	add_column :voters, :active, :boolean
  end
  def self.down
  	remove_column :voters, :active
  end
end
