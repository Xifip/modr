class CreateSpins < ActiveRecord::Migration
  def change
    create_table :spins do |t|
      t.integer :product_id
      t.integer :item_count
      t.text :description
      t.string :name

      t.timestamps
    end
  end
end
