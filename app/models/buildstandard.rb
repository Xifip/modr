class Buildstandard < ActiveRecord::Base

  has_many :mods
  belongs_to :spin

end
