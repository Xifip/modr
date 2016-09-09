class Buildstandard < ActiveRecord::Base

  has_many :mods
  belongs_to :spin
  belongs_to :bom

  validates_presence_of :bom_id, :spin_id

end
