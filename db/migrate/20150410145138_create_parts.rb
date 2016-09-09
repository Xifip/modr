class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
      t.text :description
      t.integer :tenant_id
      t.integer :master_part_id
      t.integer :tenant_part_no

      t.timestamps
    end

  end
end
