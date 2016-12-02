class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.integer :collection_id
      t.text :maintitle
      t.text :subtitle
      t.text :year
      t.text :medium
      t.text :duration
      t.text :objectnumber
      t.text :production
      t.text :department
      t.text :publisher
      t.text :printer
      t.text :edition
      t.text :copyright
      t.text :portfolio
      t.text :architectural
      t.text :dimentions
      t.text :credit
      t.text :mtype
      t.text :image
      t.timestamps
    end
  end
end
