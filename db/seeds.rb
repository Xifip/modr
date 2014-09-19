# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create([{ name: 'BM14', description: 'US sensor', product_number: 14}, { name: 'D22104', description: 'German sensor', product_number: 15 }])

Product.all.each do |product|
  bom_name_01 = product.name + "_BOM_01"
  schematic_name_01 = product.name + "_SCH_01"

  bom_name_02 = product.name + "_BOM_02"
  schematic_name_02 = product.name + "_SCH_02"

  product.spins.create([
                        { name: 'ES1', description: 'spin 1' , 
                          buildstandards_attributes: [{bom: bom_name_01, schematic: schematic_name_01, description: "build standard 1 for spin 1" }]
                        }, 
                        { name: 'ES2', description: 'spin 2' , 
                          buildstandards_attributes: [{bom: bom_name_02, schematic: schematic_name_02, description: "build standard 2 for spin 1" }]                   
                         }])
end

Spin.all.each do |spin|
  10.times do |i|
    #item_name = spin.get_item_name
    item = spin.items.create#(name: item_name)
    #item.update_attributes(name: item.item_name)
  end
end

Item.all.each do |item|
  mod_qty = rand(10)
  mod_qty.times do |i|
    mod_name = item.get_mod_name
    item.mods.create(name: mod_name)
  end
end

