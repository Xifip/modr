class Part < ActiveRecord::Base

  has_many :bomitems
  belongs_to :partable, polymorphic: true
  belongs_to :manufacturer
  has_many :distrubitors, through: :partdistributorrelationships
  
end
