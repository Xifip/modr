class CreatePartdistibutorrelationships < ActiveRecord::Migration
  def change
    create_table :partdistibutorrelationships do |t|
      t.integer :part_id
      t.integer :distributor_id
      t.string :distributor_part_no
      t.string :distributor_part_url

      t.timestamps
    end
    add_index :partdistibutorrelationships, :part_id
    add_index :partdistibutorrelationships, :distributor_id
  end
end
