class Mod < ActiveRecord::Base

  belongs_to :buildstandard
  belongs_to :item

  validates_presence_of :buildstandard_id

end
