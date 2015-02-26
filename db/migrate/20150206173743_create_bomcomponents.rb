class CreateBomcomponents < ActiveRecord::Migration
  def change
    create_table :bomcomponents do |t|
      t.string :ref
      t.string :bom_id
      t.string :component_id

      t.timestamps
    end
  end
end
