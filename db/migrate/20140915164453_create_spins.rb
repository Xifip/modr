class CreateSpins < ActiveRecord::Migration
  def change
    create_table :spins do |t|
      t.integer :product_id
      t.text :description
      t.string :name

      t.timestamps
    end
  end
end
