class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
      t.text :description
      t.integer :partable_id
      t.string :partable_type
      t.integer :manufacturer_id
      t.string :manfacturer_part_no
      t.string :manufacturer_part_url
      t.integer :distributor_id

      t.timestamps
    end
    add_index :parts, [:partable_id, :partable_type]
  end
end
