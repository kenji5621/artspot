class AddCollectionIdToInformation < ActiveRecord::Migration
  def change
  	add_index :information, :collection_id
  end
end
