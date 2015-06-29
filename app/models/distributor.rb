class Distributor < ActiveRecord::Base

  has_many :parts, through: :partdistributorrelationships  

end
