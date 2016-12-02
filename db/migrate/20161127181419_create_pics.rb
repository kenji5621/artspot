class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.integer :collection_id
      t.text :name

      t.timestamps
    end
    add_index :pics, :collection_id
  end
end
	