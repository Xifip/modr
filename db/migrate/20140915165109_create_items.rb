class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :spin_id
      t.string :name
      t.string :image_url
      t.integer :user_id
      t.string :barcodeimage
      
      t.timestamps
    end
  end
end
