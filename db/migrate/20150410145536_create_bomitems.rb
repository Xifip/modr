class CreateBomitems < ActiveRecord::Migration
  def change
    create_table :bomitems do |t|
      t.string :ref
      t.integer :bom_id
      t.integer :part_id

      t.timestamps
    end
    add_index :bomitems, :bom_id
    add_index :bomitems, :part_id
  end
end
