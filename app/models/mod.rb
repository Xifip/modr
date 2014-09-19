class Mod < ActiveRecord::Base

  belongs_to :buildstandard
  belongs_to :item

end
