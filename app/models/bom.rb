class Bom < ActiveRecord::Base

  has_many :buildstandards
  has_many :bomitems
  
end
