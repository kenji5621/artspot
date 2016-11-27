class AddActiveColumn < ActiveRecord::Migration
  def change
  end
  def up
  	add_column :voters, :active, :boolean
  end
  def down
  	remove_column :voters, :active
  end
end
