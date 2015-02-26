class CreateBoms < ActiveRecord::Migration
  def change
    create_table :boms do |t|
      t.text :description

      t.timestamps
    end
  end
end
