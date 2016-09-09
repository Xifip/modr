# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

namespace :db do
  desc "Fill database with seed data"
  task seed: :environment do
    p 'seed data'
    make_distributors
    make_manufacturers
    make_parts
    make_products
    make_spins
    make_items
    make_mods
  end
end

def make_distributors
  Distributor.create(name: 'Mouser', url: 'http://eu.mouser.com/')
  Distributor.create(name: 'Digi-Key', url: 'http://www.digikey.ie/')
  Distributor.create(name: 'Farnell', url: 'http://ie.farnell.com/')
end

def make_manufacturers
  @murata = Manufacturer.create(name: 'Murata', url: 'http://www.murata.com/')
  @tdk = Manufacturer.create(name: 'TDK', url: 'http://www.tdk.com/')
  @infineon = Manufacturer.create(name: 'Infineon Technologies', url: 'https://www.infineon.com/')
  @yageo = Manufacturer.create(name: 'Yageo', url: 'http://www.yageo.com/')
end

def make_parts

  cap_uF_vals = [0.01, 0.015, 0.022, 0.033, 0.047, 0.068, 0.1, 0.15, 0.22, 0.33, 0.47, 0.68, 1, 1.5, 2.2, 3.3, 4.7, 6.8, 10, 15, 22, 33, 47, 68, 100, 150, 220, 330, 470, 680, 1000, 1500, 2200, 3300, 4700, 6800, 10000]
  cap_pF_vals = [1, 1.1, 1.2, 1.3, 1.5, 1.6, 1.8, 2, 2.2, 2.4, 2.7, 3, 3.3, 3.6, 3.9, 4.3, 4.7, 5.1, 5.6, 6.2, 6.8, 7.5, 8.2, 9.1, 10, 11, 12, 13, 15, 16, 18, 20, 22, 24, 27, 30, 33, 36, 39, 43, 47, 51, 56, 62, 68, 75, 82, 91, 100]
  # caps
  value = rand

  # inductors

  # diodes

  # ICs

  # custom

end

def make_products
  p 'make_products'
  Product.create([{ name: 'BM14', description: 'US sensor', product_number: 14},
                  { name: 'D22104', description: 'German sensor', product_number: 15 }])
end

def make_spins
  p 'make_spins'
  Product.all.each do |product|
    product.spins.create([{ name: 'ES1', description: 'spin 1' },
                          { name: 'ES2', description: 'spin 2' }])
  end
end

def make_items
  p 'make_items'
  Spin.all.each do |spin|
    10.times do |i|
      item = spin.items.create
    end
  end
end

def make_bom
  create_bom(Product.first)
end

def make_mods
  p 'make_mods'
  Item.all.each do |item|
    spin = item.spin
    product = spin.product
    bom = create_bom(product)
    buildstandard = create_buildstandard(bom, spin)

    mod_qty = rand(10)
    mod_qty.times do |i|
      mod_name = item.get_mod_name
      p 'mod_name: ' + mod_name
      p 'buildstandard_id: ' + buildstandard.id.to_s
      modObj = item.mods.create( name: mod_name,
                                 buildstandard_id: buildstandard.id,
                                 description: mod_name.to_s )
      p 'mod buildstandard_id: ' + modObj.buildstandard_id.to_s
    end
  end
end

def create_bom(product)
  Bom.create(description: product.description + "_bom_1")
end

def create_buildstandard(bom, spin)
  product = spin.product
  spin_buildstandards = spin.buildstandards.count
  schematic_name = product.name + '_SCH_' + (spin_buildstandards + 1).to_s
  bom.buildstandards.create( schematic: schematic_name,
                             description: (spin_buildstandards + 1).to_s + "BS",
                             spin_id: spin.id )
end
