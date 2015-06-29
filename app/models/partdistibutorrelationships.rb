class Partdistibutorrelationships < ActiveRecord::Base

  belongs_to :part
  belongs_to :distributor

end
