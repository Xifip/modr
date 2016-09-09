class Bom < ActiveRecord::Base

  has_many :bomitems
  has_many :buildstandards, dependent: :destroy

  accepts_nested_attributes_for :buildstandards

end
