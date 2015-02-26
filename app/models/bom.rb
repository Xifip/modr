class Bom < ActiveRecord::Base

  has_many :buildstandard
  has_many :bomcomponents
  
end
