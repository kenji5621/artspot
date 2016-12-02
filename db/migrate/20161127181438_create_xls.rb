class CreateXls < ActiveRecord::Migration
  def change
    create_table :xls do |t|
      t.integer :collection_id
      t.text :name

      t.timestamps
    end
    add_index :xls, :collection_id
  end
end
