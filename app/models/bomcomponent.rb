class BomComponent < ActiveRecord::Base
  
  belongs_to :bom
  belongs_to :component

end
