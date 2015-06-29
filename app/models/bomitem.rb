class Bomitem < ActiveRecord::Base

  belongs_to :bom
  belongs_to :part

end
