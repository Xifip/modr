class AddBomIdToBuildstandards < ActiveRecord::Migration
  def change
    add_column :buildstandards, :bom_id, :integer
  end
end
