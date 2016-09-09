class CreateBuildstandards < ActiveRecord::Migration
  def change
    create_table :buildstandards do |t|
      t.text :description
      t.integer :spin_id
      t.integer :bom_id

      t.timestamps
    end
  end
end
