class CreatePartcustoms < ActiveRecord::Migration
  def change
    create_table :partcustoms do |t|
      t.string :type
      t.string :package
      t.string :value
      t.text :partdata
      t.text :comment
      t.string :tenant_no

      t.timestamps
    end
  end
end
