class CreateMods < ActiveRecord::Migration
  def change
    create_table :mods do |t|
      t.integer :item_id
      t.text :name
      t.text :description
      t.integer :build_rev
      t.integer :buildstandard_id

      t.timestamps
    end
  end
end
