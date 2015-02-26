class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :value
      t.string :package
      t.string :manufacturer
      t.string :manufacturer_part
      t.string :manufacturer_part_alt
      t.string :resmed_part
      t.text :description
      t.string :part_data

      t.timestamps
    end
  end
end
